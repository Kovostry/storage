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
            border: 2px solid #0066cc;
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
        }

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
        }
    </style>
</head>
<body>

<div class="container">
    <h2>📦 Облік товарів</h2>

    <!-- Сканер штрих-кодів -->
    <h2 class="section-header">📸 Сканер штрих-кодів</h2>
    <button class="btn-custom w-100">📷 Запустити сканер</button>

    <div class="scanner-container">
        <video id="scanner" class="mt-3" style="display: none;"></video>
    </div>

    <!-- Форма додавання товару -->
    <h2 class="section-header"> Додавання нового товару</h2>
    <form action="/product/create" method="post">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="📦 Найменування товару" name="productName"/>
        </div>
        <div class="input-group">
            <input type="number" class="form-control" placeholder="🔢 Кількість" name="productQuantity"/>
        </div>
        <div class="input-group">
            <input type="text" class="form-control" placeholder="📄 Серійний номер" name="serialNumber"/>
        </div>
        <div class="input-group">
            <input type="number" class="form-control" placeholder="💰 Ціна" name="productPrice"/>
        </div>
        <div class="input-group">
            <input type="text" class="form-control" placeholder="📝 Умови зберігання" name="storageConditions"/>
        </div>
        <input type="submit" class="btn-custom w-100" value="➕ Додати товар">
    </form>



        <div class="input-group mb-3">

            <button class="btn-custom" onclick="window.location.href='/product/${product.id}'">Переглянути товар</button>
        </div>

</div>

<div class="footer">
    <p>© 2025 Облік товарів. Всі права захищені.</p>
</div>
</body>
</html>
