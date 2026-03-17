<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tìm số lớn hơn</title>

    <style>
        body {
            font-family: Arial;
            background: #f2f2f2;
        }

        .box {
            width: 420px;
            margin: 80px auto;
            background: #e0e0e0;
            padding: 20px;
        }

        .title {
            background: #ccc;
            text-align: center;
            font-size: 22px;
            font-weight: bold;
            padding: 10px;
            margin-bottom: 15px;
        }

        .row {
            margin-bottom: 10px;
        }

        label {
            display: inline-block;
            width: 120px;
        }

        input {
            width: 220px;
            padding: 5px;
        }

        input[readonly] {
            background: #ddd;
        }

        .btn {
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<?php
$a = "";
$b = "";
$so_lon = "";

if (isset($_POST['tim'])) {
    $a = $_POST['a'];
    $b = $_POST['b'];

    $so_lon = ($a > $b) ? $a : $b;
}
?>

<div class="box">
    <div class="title">TÌM SỐ LỚN HƠN</div>

    <form method="post">
        <div class="row">
            <label>Số A:</label>
            <input type="number" name="a" value="<?php echo $a; ?>">
        </div>

        <div class="row">
            <label>Số B:</label>
            <input type="number" name="b" value="<?php echo $b; ?>">
        </div>

        <div class="row">
            <label>Số lớn hơn:</label>
            <input type="number" value="<?php echo $so_lon; ?>" readonly>
        </div>

        <div class="btn">
            <button type="submit" name="tim">Tìm</button>
        </div>
    </form>
</div>

</body>
</html>
