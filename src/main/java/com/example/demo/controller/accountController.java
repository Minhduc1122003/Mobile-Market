package com.example.demo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;
import java.util.Random;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.dao.AccountDAO;
import com.example.demo.dao.CartDAO;
import com.example.demo.dao.ThongkeDAO;
import com.example.demo.entity.Account;
import com.example.demo.entity.Cart;
import com.example.demo.entity.Thongke;
import com.example.demo.service.CookieService;
import com.example.demo.service.MailerService;
import com.example.demo.service.ParamService;
import com.example.demo.service.SessionService;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class accountController {
	// 1. tiêm vào dùng Service ở demo.service... thêm @Autowired

	@Autowired
	CookieService cookieService;
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	AccountDAO accountDAO;
	@Autowired
	CartDAO cartDAO;
	@Autowired
	ThongkeDAO thongkeDAO;
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	MailerService mailer;

	@RequestMapping("/layout/login")
	public String login(Model model) {

		checkLogin(model);
		Cookie cookie = cookieService.get("userValible");

		if (cookie != null) {
			Optional<Account> accounts = accountDAO.findById(cookie.getValue());

			return "redirect:/account?id=" + accounts.get().getUsername();

		} else {
			return "/login"; // 3. view lên trang account/login

		}

	}

	public void checkLogin(Model model) {
		Cookie cookie = cookieService.get("userValible");
		if (cookie != null && cookie.getName().equals("userValible")) {
			System.out.println("Người dùng đã đăng nhập: account: " + cookie.getValue());

			Optional<Account> accounts = accountDAO.findById(cookie.getValue());
			List<Cart> carts = cartDAO.findByUserID(cookie.getValue());

			if (accounts.isPresent()) {

				model.addAttribute("login", accounts.get().getFullname());
				if (!carts.isEmpty()) {
					model.addAttribute("countCart", carts.size());

				} else {
					model.addAttribute("countCart", "0");

				}
			}

		} else

		{

			model.addAttribute("login", "Đăng Nhập");

		}

	}

	@PostMapping("layout/login")
	public String login2() {
		String user = paramService.getString("user", "chua xac dinh");
		String pass = paramService.getString("password", "chua xac dinh");
		boolean remember = paramService.getBoolean("Remember", false);

		System.out.println("User: " + user + " Pass: " + pass);

		Optional<Account> accounts = accountDAO.findById(user);

		if (accounts.isPresent()) {

			// Do something with each account
			String user_Default = accounts.get().getUsername();
			String pass_Default = accounts.get().getPassword();

			if (user.equals(user_Default) && pass.equals(pass_Default)) {
				cookieService.add("userValible", user, 10);

				// nếu người dùng check vào remember
				if (remember == true) {

					// tạo 2 cookie chứa user & pass tuổi thọ cookie là 10 giờ

					cookieService.add("user", user, 10);
					cookieService.add("pass", pass, 10);
					System.out.println("Đã lưu cookie user: " + user + " Pass: " + pass);
				} else {

					// nếu không check thì xóa 2 cookie
					cookieService.remove("user");
					cookieService.remove("pass");
				}
				System.out.println("Login thành công account: " + user);
				return "redirect:/account?id=" + user;
			} else {
				System.out.println("Login thất bại");
				return "/login";

			}
		} else {
			System.out.println("Login thất bại");
			return "/login";
		}

		// 3. view lên trang account/login
	}

	@RequestMapping("/account")
	public String account(Model model, @RequestParam String id) {
		checkLogin(model);

		System.out.println("Đã nhận được User By account: " + id);
		Optional<Account> optionalAccount = accountDAO.findById(id);

		// account tồn tại
		if (optionalAccount.isPresent()) {

			Account user = optionalAccount.get();
			// Chuyển đổi ngày sinh từ Date sang LocalDate
			Date day = user.getBirthday();
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			String formattedDate = sdf.format(day);

			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
			LocalDate birthDate = LocalDate.parse(formattedDate, formatter);

			user.setBirthday(java.sql.Date.valueOf(birthDate));
			model.addAttribute("user", user);
			model.addAttribute("users", List.of(user)); // Đưa vào một danh sách để dùng cho <c:forEach>
			String gmail = convertEmail(user.getEmail());
			System.out.println("gmail:" + gmail);
			user.setEmail(gmail);
			if (user.getActivated() == true) {
				user.setActivateString("Đã kích hoạt");
			} else {
				user.setActivateString("Chưa kích hoạt");

			}
			System.out.println("acctivate: " + user.getActivateString());
		} else {
			// Xử lý trường hợp không tìm thấy account theo id
			System.out.println("Không tìm thấy account với id: " + id);
			// Có thể thêm logic xử lý ở đây, ví dụ như redirect hoặc thông báo lỗi
		}

		return "/account"; // View lên trang account
	}

	@RequestMapping("/account/edit")
	public String accountEdit(Model model, @RequestParam String id) {
		checkLogin(model);

		System.out.println("Đã nhận được User By accountEdit: " + id);
		Optional<Account> optionalAccount = accountDAO.findById(id);

		// account tồn tại
		if (optionalAccount.isPresent()) {

			Account user = optionalAccount.get();
			// Chuyển đổi ngày sinh từ Date sang LocalDate
			Date day = user.getBirthday();
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			String formattedDate = sdf.format(day);

			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
			LocalDate birthDate = LocalDate.parse(formattedDate, formatter);

			user.setBirthday(java.sql.Date.valueOf(birthDate));
			model.addAttribute("user", user);
			model.addAttribute("users", List.of(user)); // Đưa vào một danh sách để dùng cho <c:forEach>

			System.out.println("gender:" + user.getGender());
			System.out.println("admin:" + user.getAdmin());
			String gmail = convertEmail(user.getEmail());
			System.out.println("gmail:" + gmail);
			user.setEmail(gmail);
			if (user.getActivated() == true) {
				user.setActivateString("Đã kích hoạt");
			} else {
				user.setActivateString("Chưa kích hoạt");

			}
			System.out.println("acctivate: " + user.getActivateString());
		} else {
			// Xử lý trường hợp không tìm thấy account theo id
			System.out.println("Không tìm thấy account với id: " + id);
			// Có thể thêm logic xử lý ở đây, ví dụ như redirect hoặc thông báo lỗi
		}

		return "/accountEdit"; // View lên trang account
	}

	private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

	public static String generateActivationCode() {
		Random random = new Random();
		StringBuilder sb = new StringBuilder(8); // Độ dài mã xác nhận là 8 ký tự

		for (int i = 0; i < 8; i++) {
			int randomIndex = random.nextInt(CHARACTERS.length());
			char randomChar = CHARACTERS.charAt(randomIndex);
			sb.append(randomChar);
		}

		return sb.toString();
	}

	@PostMapping("/activatedAccount")
    @ResponseBody
    public String activatedAccount() {
        Cookie cookie = cookieService.get("userValible");
        if (cookie != null && cookie.getName().equals("userValible")) {
            Optional<Account> accounts = accountDAO.findById(cookie.getValue());
            if (accounts.isPresent()) {
                Account user = accounts.get();
                accountDAO.setActivatedByUsername(user.getUsername());
                System.out.println("Kích hoạt thành công!");

                // Chuyển hướng người dùng đến trang chỉnh sửa tài khoản
                return "/account/edit?id=" + user.getUsername();
            }
        }
        // Nếu không tìm thấy tài khoản, hoặc không có cookie, chuyển hướng về trang login
        return "/layout/login";
    }

	@RequestMapping(value = "/sendActivationCode", method = RequestMethod.POST)
	@ResponseBody
	public String sendActivationCode() {
		String activationCode = generateActivationCode();

		Cookie cookie = cookieService.get("userValible");
		if (cookie != null && cookie.getName().equals("userValible")) {
			System.out.println("Người dùng đã đăng nhập: account: " + cookie.getValue());

			Optional<Account> accounts = accountDAO.findById(cookie.getValue());
			if (accounts.isPresent()) {

				Account user = accounts.get();

				// Thay thế bằng logic sinh mã xác nhận

				// Thay thế bằng địa chỉ email của người dùng
				String userEmail = user.getEmail();
				System.out.println("");
				try {
					mailer.send(userEmail, "Kích hoạt tài khoản form localHost",
							"Bạn đã yêu cầu kích hoạt tài khoản qua email. \n " + "Mã kích hoạt của bạn là: <b>"
									+ activationCode + "</b>");
					System.out.println("Mail đã được gửi cho id: " + userEmail + "Mã code: " + activationCode);
					return activationCode; // Trả về mã kích hoạt
				} catch (MessagingException e) {
					return e.getMessage();
				}

			}

		}
		return activationCode;

	}

	@RequestMapping("/account/edit/success")
	public String accountEditSuccess(Model model, @RequestParam String id) {
		checkLogin(model);

		System.out.println("Đã nhận được User By accountEdit: " + id);
		Optional<Account> optionalAccount = accountDAO.findById(id);

		// account tồn tại
		if (optionalAccount.isPresent()) {

			Account user = optionalAccount.get();
			// Chuyển đổi ngày sinh từ Date sang LocalDate
			Date day = user.getBirthday();
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			String formattedDate = sdf.format(day);

			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
			LocalDate birthDate = LocalDate.parse(formattedDate, formatter);

			user.setBirthday(java.sql.Date.valueOf(birthDate));
			model.addAttribute("user", user);
			model.addAttribute("users", List.of(user)); // Đưa vào một danh sách để dùng cho <c:forEach>

			System.out.println("gender:" + user.getGender());
			System.out.println("admin:" + user.getAdmin());
			String gmail = convertEmail(user.getEmail());
			System.out.println("gmail:" + gmail);
			user.setEmail(gmail);
			if (user.getActivated() == true) {
				user.setActivateString("Đã kích hoạt");
			} else {
				user.setActivateString("Chưa kích hoạt");

			}
			System.out.println("acctivate: " + user.getActivateString());
		} else {
			// Xử lý trường hợp không tìm thấy account theo id
			System.out.println("Không tìm thấy account với id: " + id);
			// Có thể thêm logic xử lý ở đây, ví dụ như redirect hoặc thông báo lỗi
		}

		return "/accountEdit"; // View lên trang account
	}

	public String convertEmail(String email) {
		int atIndex = email.indexOf('@');
		if (atIndex == -1) {
			return email; // Trả về email gốc nếu không tìm thấy '@'
		}

		String username = email.substring(0, atIndex);
		String domain = email.substring(atIndex);

		// Lấy 3 ký tự đầu của username, nếu không đủ thì lấy hết
		String firstThreeChars = username.substring(0, Math.min(username.length(), 3));

		// Lấy 1 ký tự sau '@'
		String nextCharAfterAt = atIndex + 1 < email.length() ? String.valueOf(email.charAt(atIndex + 1)) : "";

		// Lấy 4 ký tự cuối của domain, nếu không đủ thì lấy hết
		String lastThreeChars = domain.length() > 4 ? domain.substring(domain.length() - 4) : domain.substring(1);

		// Tạo chuỗi dấu '*' với độ dài bằng số ký tự còn lại của username và domain
		String maskedUsername = "*".repeat(username.length() - firstThreeChars.length());
		String maskedDomain = "*".repeat(domain.length() - nextCharAfterAt.length() - lastThreeChars.length());

		return firstThreeChars + maskedUsername + "@" + nextCharAfterAt + maskedDomain + lastThreeChars;
	}

	// http://localhost:9999/SSO/signingoogle?continue

	@GetMapping("/layout/register")
	public String register(Model model) {
		checkLogin(model);

		return "register"; // 3. view lên trang account/login
	}

	@RequestMapping("/layout/reset3")
	public String reset3() {
		return "redirect:/layout/create2";

	}

	@RequestMapping(value = "/layout/create", method = RequestMethod.POST)
	public String register2(@ModelAttribute("user") Account user) {
		// thao tác chuyển đổi định dạng ngày sinh của user
		String day = paramService.getString("birthday1", "Khong nhan dc birthday");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate birthDate = LocalDate.parse(day, formatter);

		// định dạng xong thì set vào biến user
		user.setBirthday(java.sql.Date.valueOf(birthDate));

		// get giới tính của form
		boolean gender;
		String genderValue = paramService.getString("gender1", ""); // Lấy giá trị của radio button
		if (genderValue.equals("male")) {
			gender = true; // Nam
		} else {
			gender = false; // Nữ
		}
		user.setGender(gender);
		user.setActivated(true);
		user.setAdmin(false);
		user.setPhoto("photo1.jpg");

		System.out.println("===========================");

		System.out.println("User username: " + user.getUsername());
		System.out.println("User activated: " + user.getActivated());
		System.out.println("User admin: " + user.getAdmin());
		System.out.println("User email: " + user.getEmail());
		System.out.println("birthday của user: " + user.getBirthday());
		System.out.println("GENDER: " + genderValue + " - " + user.getGender());
		System.out.println("Fullname của user: " + user.getFullname());
		System.out.println("Password của user :" + user.getPassword());
		System.out.println("Photo của user :" + user.getPhoto());
		System.out.println("===========================");

		accountDAO.save(user);
		System.out.println("Register Successfully!!!!");

		return "redirect:/layout/login";
	}

	@GetMapping("/logout")
	public String logout(HttpServletResponse response) {
		// Xóa cookie bằng cách đặt giá trị của nó thành null và set thời gian sống là 0
		Cookie cookie = new Cookie("userValible", null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		cookieService.remove("user");
		cookieService.remove("pass");

		// Redirect về trang "/layout/index"
		return "redirect:/layout/index";
	}

	// Hàm tính toán giá cuối cùng sau khi giảm giá
	private double calculateFinalAmount(double originalPrice, int discount) {
		return originalPrice - (originalPrice * discount / 100);
	}

	@RequestMapping("/layout/thongke")
	public String thongke(Model model) {
		checkLogin(model);
		List<Map<String, Object>> thongkeList = thongkeDAO.thongkeTongDoanhThu();
		List<Map<String, Object>> thongkeNguoidung = thongkeDAO.thongkeTungNguoiDung();

		// Tạo một ArrayList để lưu trữ các đối tượng ThongKeEntity
		List<Thongke> entityList = new ArrayList<>();

		// Lặp qua danh sách thongkeList và chuyển đổi các bản ghi sang đối tượng
		// ThongKeEntity
		for (Map<String, Object> record : thongkeList) {
			Thongke entity = new Thongke();
			entity.setYear((int) record.get("Year"));
			entity.setMonth((int) record.get("Month"));
			entity.setTotalOrders((int) record.get("TotalOrders"));
			entity.setTotalRevenue((double) record.get("TotalRevenue"));
			entity.setTotalQuantitySold((int) record.get("TotalQuantitySold"));

			entityList.add(entity); // Thêm đối tượng ThongKeEntity vào ArrayList
		}

		System.out.println(entityList);

		// Đổ dữ liệu vào model để hiển thị trong view
		model.addAttribute("thongkeList", entityList);
		model.addAttribute("thongkeNguoidung", thongkeNguoidung);
		List<Map<String, Object>> thongkeTungSP = thongkeDAO.thongkeTungSP();

		// Định dạng tiền cho giá sản phẩm trong danh sách
		for (Map<String, Object> item : thongkeTungSP) {

			double gia_cu = (double) item.get("price");
			int giamgia = (int) item.get("sale");
			double gia_Moi = calculateFinalAmount(gia_cu, giamgia);

			// Định dạng giá tiền
			String formattedPrice = formatNumber(gia_Moi);
			double sum = gia_Moi * (int) item.get("quantity");
			String sum_gia = formatNumber(sum);

			Date day = (Date) item.get("OrderDate");
			// Định dạng ngày tháng năm
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			String formattedDate = sdf.format(day);

			// Đặt lại giá trị đã định dạng vào Map
			item.put("formattedPrice", formattedPrice);
			item.put("sumPrice", sum_gia);
			item.put("formattedOrderDate", formattedDate);
			System.out.println(day);
			// Đặt lại giá trị đã định dạng vào Map
			item.put("formattedPrice", formattedPrice);

			item.put("sumPrice", sum_gia);

		}

		// Thêm danh sách đã được định dạng giá vào model
		model.addAttribute("thongkeTungSP", thongkeTungSP);
		System.out.println("=====================================");
		System.out.println(thongkeTungSP);

		return "/thongke";
	}

	@RequestMapping(value = "/layout/thongke1", method = RequestMethod.GET)
	public void exportToExcel(HttpServletResponse response) throws IOException {
		List<Map<String, Object>> thongkeTungSP = thongkeDAO.thongkeTungSP();

		for (Map<String, Object> item : thongkeTungSP) {
			double gia_cu = (double) item.get("price");
			int giamgia = (int) item.get("sale");
			double gia_Moi = calculateFinalAmount(gia_cu, giamgia);

			String formattedPrice = formatNumber(gia_Moi);
			double sum = gia_Moi * (int) item.get("quantity");
			String sum_gia = formatNumber(sum);

			Date day = (Date) item.get("OrderDate");
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			String formattedDate = sdf.format(day);

			item.put("formattedPrice", formattedPrice);
			item.put("sumPrice", sum_gia);
			item.put("formattedOrderDate", formattedDate);
			item.put("formattedPrice", formattedPrice);
			item.put("sumPrice", sum_gia);
		}

		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment; filename=thongke.xlsx");

		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("Thống Kê Sản Phẩm");

		Row headerRow = sheet.createRow(0);
		String[] headers = { "Product Name", "Formatted Price", "Sum Price", "Formatted Order Date" };
		for (int i = 0; i < headers.length; i++) {
			Cell cell = headerRow.createCell(i);
			cell.setCellValue(headers[i]);
		}

		int rowNum = 1;
		for (Map<String, Object> item : thongkeTungSP) {
			Row row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue((String) item.get("productName"));
			row.createCell(1).setCellValue((String) item.get("formattedPrice"));
			row.createCell(2).setCellValue((String) item.get("sumPrice"));
			row.createCell(3).setCellValue((String) item.get("formattedOrderDate"));
		}

		workbook.write(response.getOutputStream());
		workbook.close();
	}

	public static String formatNumber(double number) {
		DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.getDefault());
		symbols.setGroupingSeparator('.');
		DecimalFormat formatter = new DecimalFormat("#,###", symbols);
		return formatter.format(number);
	}

	// Hàm tính toán giá trị mới sau khi giảm phần trăm
	public static double calculateFinalAmount(double amount, double percentage) {
		// Tính giá trị phần trăm cần giảm
		double reduction = amount * (percentage / 100);

		// Trừ giá trị phần trăm đã tính khỏi số ban đầu
		double finalAmount = amount - reduction;

		return finalAmount;
	}

	@RequestMapping("/layout/thongke/loc")
	public String thongke2(Model model, @RequestParam("year") String year, @RequestParam("month") String month) {
		checkLogin(model);
		System.out.println(year);
		List<Map<String, Object>> thongkeList = thongkeDAO.thongkeTongDoanhThu();

		System.out.println(thongkeList);
		// Đổ dữ liệu vào model để hiển thị trong view
		model.addAttribute("thongkeList", thongkeList);
		return "/thongke";

	}

}
