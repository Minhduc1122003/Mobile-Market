package com.example.demo.controller;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dao.AccountDAO;
import com.example.demo.dao.CapacityDAO;
import com.example.demo.dao.CartDAO;
import com.example.demo.dao.ColorDAO;
import com.example.demo.dao.ProductDAO;
import com.example.demo.entity.Account;
import com.example.demo.entity.Capacity;
import com.example.demo.entity.Cart;
import com.example.demo.entity.Product;
import com.example.demo.entity.Color;
import com.example.demo.service.CookieService;
import com.example.demo.service.ParamService;
import com.example.demo.service.SessionService;

import jakarta.servlet.http.Cookie;

@Controller
public class productController {
	@Autowired
	CookieService cookieService;
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	AccountDAO accountDAO;
	@Autowired
	ProductDAO productDAO;
	@Autowired
	CartDAO cartDAO;
	@Autowired
	CapacityDAO capacityDAO;
	@Autowired
	ColorDAO colorDAO;

	@RequestMapping("/layout/index")
	public String index(Model model) {
		checkLogin(model);
		List<Product> productList = productDAO.findAll();
		// Duyệt qua danh sách sản phẩm để định dạng giá
		for (Product product : productList) {
			String formattedPrice = formatNumber(product.getPrice());
			double gia_Moi = calculateFinalAmount(product.getPrice(), product.getSale());
			String formattedAmount = formatNumber(gia_Moi);

			product.setPriceOld(formattedPrice);
			product.setPriceNew(formattedAmount);

		}
		model.addAttribute("product", productList);

		return "/index"; // 3. view lên trang account/login
	}

	@RequestMapping(value = "/layout/chitietsanpham/insert", method = RequestMethod.POST)
	public String addCart(Model model, @RequestParam int id) {

		int capacityId = paramService.getInt("capacityID", 0);
		int colorId = paramService.getInt("colorID", 0);
		System.out.println("colorID = " + colorId);
		// 1. lấy dữ liệu
		Cookie cookie = cookieService.get("userValible");
		String userID = cookie.getValue();
//        Capacity capacity = capacityDAO.findById(capacityId).orElse(null);

		// Tìm sản phẩm theo id
		Optional<Product> sp = productDAO.findById(id);
		Optional<Capacity> capacityOpt = capacityDAO.findById(capacityId);
		Optional<Color> colorOpt = colorDAO.findById(colorId);

		// nếu tất cả hợp lệ
		if (sp.isPresent() && capacityOpt.isPresent() && colorOpt.isPresent()) {
			Product product = sp.get();
			Capacity capacity = capacityOpt.get();
			Color color = colorOpt.get();

			// Kiểm tra nếu sản phẩm đã có trong giỏ hàng
			Cart existingCartItem = cartDAO.findByUserIDAndProductIDAndColorIDAndCapacityID(userID, product.getId(),
					color.getId(), capacity.getId());

			if (existingCartItem != null) {
				// Cập nhật số lượng và các thuộc tính khác nếu cần
				int quantity = existingCartItem.getQuantity() + 1;
				cartDAO.updateCart(userID, product.getId(), quantity, color.getId(), capacity.getId());
				System.out.println("Đã cập nhật giỏ hàng!");
			} else {
				// Thêm sản phẩm mới vào giỏ hàng
				Cart newCartItem = new Cart();
				newCartItem.setUserID(userID);
				newCartItem.setProductID(product);
				newCartItem.setQuantity(1);
				newCartItem.setCapacityID(capacity);
				newCartItem.setColorID(color);
				cartDAO.save(newCartItem);
				System.out.println("Đã thêm mới giỏ hàng!");
			}
		}

		return "redirect:/layout/chitietsanpham?id=" + id; // Điều hướng người dùng đến trang giỏ hàng sau khi cập nhật.
	}

	@RequestMapping("/layout/cart")
	public String chitietSP(Model model) {
		checkLogin(model);
		Cookie cookie = cookieService.get("userValible");
		if (cookie != null && cookie.getName().equals("userValible")) {
			String username = cookie.getValue();
			List<Cart> carts = cartDAO.findByUserID(username);
			List<Product> products = new ArrayList<>();

			for (Cart cart : carts) {
				int id = cart.getCartID();
				int quantity = cart.getQuantity();

				Product product = cart.getProductID();
				Product clonedProduct = new Product();

				Color color = cart.getColorID();
				String colorName = color.getName();

				Capacity capacity = cart.getCapacityID();
				int capacityDetail = capacity.getDetail();

				double gia_cu = product.getPrice();
				int giamgia = product.getSale();
				double gia_Moi = calculateFinalAmount(gia_cu, giamgia);

				double sum = gia_Moi * quantity;
				String sum_Format = formatNumber(sum);

				String formattedAmount = formatNumber(gia_Moi);
				String gia_cuFormat = formatNumber(gia_cu);

				clonedProduct.setIdCartProduct(cart.getCartID());

				clonedProduct.setImage(product.getImage());
				clonedProduct.setName(product.getName());

				clonedProduct.setSum(sum_Format);
				clonedProduct.setPriceOld(gia_cuFormat);
				clonedProduct.setPriceNew(formattedAmount);
				clonedProduct.setCount(quantity);
				clonedProduct.setColorName(colorName);
				clonedProduct.setCapacityName(capacityDetail);

				products.add(clonedProduct);
			}

			model.addAttribute("products", products);
		}

		return "/cart";

	}

	@GetMapping("/layout/cart/edit")
	public String updateCart(@RequestParam String action, @RequestParam Integer id) {
		// Xử lý yêu cầu tại đây, với action là "decrease" hoặc "increase", và id là id

		System.out.println("idCardProduct: " + id);
		Cookie cookie = cookieService.get("userValible");
		if (cookie != null && cookie.getName().equals("userValible")) {
			String username = cookie.getValue();
			// của sản phẩm.

			// khi chọn giảm sp
			if (action.equals("decrease")) {
				Optional<Cart> cartItem = cartDAO.findById(id);
				if (cartItem != null) {
					// Giảm số lượng đi 1 nếu số lượng hiện tại lớn hơn 1
					int newQuantity = cartItem.get().getQuantity() - 1;
					if (newQuantity > 0) {
						cartDAO.updateQuantity(id, newQuantity);
					} else {
						cartDAO.deleteById(id);
					}
				}
			} else if (action.equals("increase")) {
				Optional<Cart> cartItem = cartDAO.findById(id);
				if (cartItem != null) {
					// Giảm số lượng đi 1 nếu số lượng hiện tại lớn hơn 1
					int newQuantity = cartItem.get().getQuantity() + 1;
					if (newQuantity > 0) {
						cartDAO.updateQuantity(id, newQuantity);
					} else {
						cartDAO.deleteById(id);
					}
				}
			} else if (action.equals("delete")) {
				cartDAO.deleteById(id);

			}
		}
		return "redirect:/layout/cart"; // Điều hướng người dùng đến trang giỏ hàng sau khi cập nhật.
	}

	@RequestMapping("/layout/chitietsanpham")
	public String chitietSP(Model model, @RequestParam Integer id) {
		checkLogin(model);
		Optional<Product> optionalProduct = productDAO.findById(id);
		if (optionalProduct.isPresent()) {
			Product sp = optionalProduct.get();

			double gia_cu = sp.getPrice();
			int giamgia = sp.getSale();
			double gia_Moi = calculateFinalAmount(gia_cu, giamgia);

			// chuyển đổi giá mới sang định dạng 1.000.000
			String formattedAmount = formatNumber(gia_Moi);
			String gia_cuFormat = formatNumber(gia_cu);

			sp.setPriceOld(gia_cuFormat);
			sp.setPriceNew(formattedAmount);

			double gia_256 = gia_cu * 1.25;
			double gia_512 = gia_256 * 1.5;
			String gia_256format = formatNumber(gia_256);

			String gia_512format = formatNumber(gia_512);

			sp.setPrice256(gia_256format);
			sp.setPrice512(gia_512format);

			model.addAttribute("product", sp);
			model.addAttribute("products", List.of(sp));
		}
		return "/detalProduct"; // 3. view lên trang account/login

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

	public void checkLogin(Model model) {
		Cookie cookie = cookieService.get("userValible");
		if (cookie != null && cookie.getName().equals("userValible")) {
			System.out.println("Người dùng đã đăng nhập: account: " + cookie.getName());

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
}
