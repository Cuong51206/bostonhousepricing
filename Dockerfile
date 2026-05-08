# 1. Chọn hệ điều hành máy chủ (dùng Python 3.10 bản nhẹ nhất)
FROM python:3.10-slim

# 2. Tạo một thư mục tên là /app trên máy chủ để chứa code
WORKDIR /app

# 3. Copy file danh sách thư viện vào trước
COPY requirements.txt .

# 4. Ra lệnh cho máy chủ cài đặt các thư viện đó
RUN pip install -r requirements.txt

# 5. Copy toàn bộ file code còn lại (app.py, model, file html...) vào máy chủ
COPY . .

# 6. Mở cổng 5000 để giao tiếp với bên ngoài
EXPOSE 5000

# 7. Khởi động động cơ gunicorn để chạy app
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]