<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // フォームから送信されたデータを取得
    $name = htmlspecialchars($_POST['name']);
    $email = htmlspecialchars($_POST['email']);
    $message = htmlspecialchars($_POST['message']);

    // メール内容の設定
    $to = 'formmessage@commonality-atelier.com'; // 送信先のXserverのメールアドレス
    $subject = 'お問い合わせフォームからのメッセージ';
    $body = "名前: $name\nメールアドレス: $email\nメッセージ:\n$message";
    $headers = "From: $email\r\n";
    $headers .= "Reply-To: $email\r\n";
    $headers .= "Content-Type: text/plain; charset=UTF-8\r\n";

    // メール送信
    if (mail($to, $subject, $body, $headers)) {
        echo 'メールが送信されました';
    } else {
        echo 'メール送信に失敗しました';
    }
}
?>
