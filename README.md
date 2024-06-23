# Flutter API Project

Overview
--------
This Flutter API project demonstrates how to fetch and display categories and products from a backend API using Flutter. The project includes two primary APIs: one for fetching categories and one for fetching products. It also includes models for category and product data, and UI components to display the fetched data.

Features
--------
- Fetch categories from an API and display them in a horizontal scrollable row.
- Fetch products from an API and display them in a grid view.
- Filter products based on selected category.

Project Structure
-----------------
The project structure is organized as follows:
```
lib/
|-- data.api/
|   |-- category_api.dart
|   |-- product_api.dart
|-- models/
|   |-- category.dart
|   |-- product.dart
|-- widgets/
|   |-- product_list_widget.dart
|   |-- product_list_row_widget.dart
|-- main.dart
db.json
```

Installation
------------
1. Clone the repository

```
  git clone https://github.com/sametartann/api_demo.git
  cd api_demo
```

2. Install dependencies
   `flutter pub get`

3. Run the app
   `flutter run`

Setting Up Local Host
---------------------
1. Install JSON Server globally:
   'npm install -g json-server'

2. Navigate to the project directory and start the JSON Server:
   'json-server --watch db.json --port 3000'

3. The local server will be running at:
   'http://localhost:3000'

Usage
-----
API Endpoints
The project uses the following local API endpoints:

- Categories: `http://10.0.2.2:3000/categories`
- Products: `http://10.0.2.2:3000/products`
- Products by Category ID: `http://10.0.2.2:3000/products?categoryId=<id>`

