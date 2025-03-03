<!DOCTYPE html>
<html lang="uk">
<head>
    <title>Storage</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #0066cc, #33b5e5);
            font-family: 'Poppins', sans-serif;
            color: #333;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #0066cc;
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 30px;
            font-weight: 600;
        }

        .btn-custom {
            background: #0066cc;
            color: white;
            border: none;
            padding: 14px;
            margin-top: 20px;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 1.2rem;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .btn-custom:hover {
            background: #004c99;
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2);
        }

        .input-group {
            margin-bottom: 25px;
        }

        .input-group input {
            font-size: 1.2rem;
            padding: 12px;
            border-radius: 10px;
            border: 2px solid #0066cc;
            transition: border-color 0.3s ease;
        }

        .input-group input:focus {
            border-color: #33b5e5;
            outline: none;
        }

        table {
            width: 100%;
            margin-top: 30px;
            background: #f9f9f9;
            border-radius: 10px;
            border: 1px solid #0066cc;
            font-size: 1.1rem;
            overflow: hidden;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.05);
        }

        th {
            background: #0066cc;
            color: white;
            padding: 12px;
            font-size: 1.2rem;
            text-align: center;
        }

        td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #f1f1f1;
        }

        td:hover {
            background-color: #f0f8ff;
            cursor: pointer;
        }

        .scanner-container {
            display: flex;
            justify-content: center;
            margin-top: 40px;
        }

        video {
            width: 100%;
            border-radius: 12px;
            max-height: 400px;
            display: none;
        }

        .row-button-group {
            display: flex;
            gap: 20px;
            margin-top: 30px;
        }

        .row-button-group .btn-custom {
            flex: 1;
        }

        .section-header {
            color: #0066cc;
            font-size: 1.8rem;
            margin-top: 40px;
            font-weight: 500;
        }

        .footer {
            margin-top: 50px;
            text-align: center;
            font-size: 1rem;
            color: #666;
        }

        /* Адаптація для різних пристроїв */
        @media (max-width: 1200px) {
            .container {
                padding: 30px;
            }

            h2 {
                font-size: 2rem;
            }

            .btn-custom {
                font-size: 1.1rem;
            }
        }

        /* Адаптація для ноутбуків */
        @media (max-width: 992px) {
            .container {
                padding: 20px;
            }

            h2 {
                font-size: 1.8rem;
            }

            .input-group input {
                font-size: 1rem;
            }

            .btn-custom {
                font-size: 1rem;
            }
        }

        /* Адаптація для планшетів */
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            .scanner-container {
                flex-direction: column;
            }

            .row-button-group {
                flex-direction: column;
            }

            .row-button-group .btn-custom {
                margin-bottom: 10px;
            }

            h2 {
                font-size: 1.6rem;
            }

            .input-group input {
                font-size: 0.9rem;
            }
        }

        /* Адаптація для мобільних телефонів */
        @media (max-width: 576px) {
            .container {
                padding: 10px;
            }

            h2 {
                font-size: 1.4rem;
            }

            .input-group input {
                font-size: 0.9rem;
                padding: 10px;
            }

            .btn-custom {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
<h2 class="section-header">📋 Список товарів</h2>

<div class="row-button-group">
    <button class="btn-custom" >🔄 Оновити список</button>
    <button class="btn-custom" >📤 Експорт в Excel</button>
    <form action="/product/delete/${product.id}" method="post">>
        <input type="submit" value="Видалити список">
    </form>
</div>

<table class="table table-bordered text-center">
    <thead>
    <tr>

        <th>Найменування </th>
        ${product.productName}
        <th>Кількість </th>
        ${product.productQuantity}
        <th>Серійний номер </th>
        ${product.serialNumber}
        <th>Ціна </th>
        ${product.productPrice}
        <th>Умови зберігання </th>
        ${product.storageConditions}
    </tr>
    </thead>
    <tbody id="product_list"></tbody>
</table>


<div class="footer">
    <p>&copy; 2025 Облік товарів. Всі права захищені.</p>
</div>
</body>
</html>