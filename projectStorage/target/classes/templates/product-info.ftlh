<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Облік товарів</title>
    <!-- Підключаємо Bootstrap -->
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
            overflow-x: auto;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.05);
            table-layout: fixed;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #0066cc;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        th {
            background: #0066cc;
            color: white;
            width: 20%;
        }

        td {
            width: 20%;
        }

        td:hover {
            background-color: #e6f0fa;
            cursor: pointer;
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
            color: #ffffff;
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
            table {
                font-size: 1rem;
            }
            th, td {
                padding: 10px;
            }
        }

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
            table {
                font-size: 0.9rem;
            }
            th, td {
                padding: 8px;
            }
        }

        @media (max-width: 768px) {
            .container {
                padding: 15px;
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
            table {
                font-size: 0.8rem;
            }
            th, td {
                padding: 6px;
                width: 25%;
            }
        }

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
                font-size: 0.8rem;
            }
            table {
                font-size: 0.7rem;
            }
            th, td {
                padding: 4px;
                width: 30%;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="section-header">📋 Список товарів</h2>

    <div class="row-button-group">
        <button class="btn-custom" id="exportExcel">📤 Експорт в Excel</button>
        <form action="/product/delete" method="post">
            <input type="submit" class="btn-custom" value="🗑️ Видалити список">
        </form>
    </div>

    <table class="table table-bordered text-center" id="productTable">
        <thead>
        <tr>
            <th>Найменування</th>
            <th>Кількість</th>
            <th>Серійний номер</th>
            <th>Ціна</th>
            <th>Умови зберігання</th>
        </tr>
        </thead>
        <tbody id="product_list">

            <tr>
                <td>${product.productName}</td>
                <td>${product.productQuantity}</td>
                <td>${product.serialNumber}</td>
                <td>${product.productPrice}</td>
                <td>${product.storageConditions}</td>
            </tr>

        </tbody>
    </table>
</div>

<div class="footer">
    <p>© 2025 Облік товарів. Всі права захищені.</p>
</div>

<!-- Підключення бібліотеки SheetJS -->
<script src="https://cdn.sheetjs.com/xlsx-latest/package/dist/xlsx.full.min.js"></script>
<script>
    document.getElementById('exportExcel').addEventListener('click', function() {
        const table = document.getElementById('productTable');
        const wb = XLSX.utils.table_to_book(table, { sheet: "Sheet1" });
        XLSX.writeFile(wb, 'список_товарів.xlsx');
    });
</script>
</body>
</html>
