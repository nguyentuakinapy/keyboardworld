package com.asmkbw.service;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class ParamService {
	@Autowired
	HttpServletRequest request;

	/**
	 * Đọc chuỗi giá trị của tham số
	 * 
	 * @param name         tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 */
	public String getString(String name, String defaultValue) {
		return request.getParameter(name) != null ? request.getParameter(name) : defaultValue;

	}

	/**
	 * Đọc số nguyên giá trị của tham số
	 * 
	 * @param name         tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 */
	public int getInt(String name, int defaultValue) {
		try {
			return request.getParameter(name) != null ? Integer.parseInt(request.getParameter(name)) : defaultValue;
		} catch (NumberFormatException e) {
			return defaultValue;
		}
	}

	/**
	 * Đọc số thực giá trị của tham số
	 * 
	 * @param name         tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 */
	public double getDouble(String name, double defaultValue) {
		try {
			return request.getParameter(name) != null ? Double.parseDouble(request.getParameter(name)) : defaultValue;
		} catch (NumberFormatException e) {
			return defaultValue;
		}
	}

	/**
	 * Đọc giá trị boolean của tham số
	 * 
	 * @param name         tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 */
	public boolean getBoolean(String name, boolean defaultValue) {
		if (request.getParameter(name) != null) {
			if (request.getParameter(name).equalsIgnoreCase("true")) {
				return true;
			} else if (request.getParameter(name).equalsIgnoreCase("false")) {
				return false;
			}
		}
		return defaultValue;
	}

	/**
	 * Đọc giá trị thời gian của tham số
	 * 
	 * @param name    tên tham số
	 * @param pattern là định dạng thời gian
	 * @return giá trị tham số hoặc null nếu không tồn tại
	 * @throws ParseException
	 * @throws RuntimeException lỗi sai định dạng
	 */
	public Date getDate(String name, String pattern) throws ParseException {
		if (request.getParameter(name) == null) {
			return null;
		}
		try {
			SimpleDateFormat format = new SimpleDateFormat(pattern);
			return format.parse(request.getParameter(name));
		} catch (RuntimeException e) {
			throw new RuntimeException("Lỗi sai định dạng!");
		}
	}

	/**
	 * Lưu file upload vào thư mục
	 * 
	 * @param file chứa file upload từ client
	 * @param path đường dẫn tính từ webroot
	 * @return đối tượng chứa file đã lưu hoặc null nếu không có file upload
	 * @throws IOException
	 * @throws IllegalStateException
	 * @throws RuntimeException      lỗi lưu file
	 */
//	public File save(MultipartFile file, String path) throws IllegalStateException, IOException {
////		if (!file.isEmpty()) {
//		String fileName = file.getOriginalFilename();
//		File f = new File(path + fileName);
//		file.transferTo(f);
//		System.out.println(file);
//		return f;
////		}
////		return null;
//
//	}

	public File save(MultipartFile file, String path) throws IllegalStateException, IOException {
		// Kiểm tra nếu tệp không rỗng
		if (!file.isEmpty()) {
			String fileName = file.getOriginalFilename();
			File f = new File(path + fileName);

			// Kiểm tra nếu tệp đã tồn tại
			if (!f.exists()) {
				// Lưu tệp nếu nó chưa tồn tại
				file.transferTo(f);
				System.out.println("File saved: " + file);
				return f;
			} else {
				// Không lưu tệp nếu nó đã tồn tại
				System.out.println("File already exists: " + file);
				return null;
			}
		}

		return null;
	}

	public File deleteFile(String file) throws IllegalStateException, IOException {
//		if (f.exists()) {
		File f = new File(file);
		f.delete();
		System.out.println("File đã bị xóa do thất bại: " + f);
		return f;
//		}
//		return null;

	}
}
