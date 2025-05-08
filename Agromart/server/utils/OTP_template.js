OTP_template=`<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Your OTP Code - Agromart</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }
    .container {
      background-color: #ffffff;
      max-width: 500px;
      margin: 30px auto;
      padding: 20px 30px;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    .logo {
      text-align: center;
      font-size: 24px;
      color: #4CAF50;
      font-weight: bold;
      margin-bottom: 20px;
    }
    .otp-box {
      font-size: 28px;
      font-weight: bold;
      color: #333333;
      text-align: center;
      margin: 20px 0;
      letter-spacing: 4px;
    }
    .message {
      font-size: 16px;
      color: #555555;
      margin-bottom: 30px;
      text-align: center;
    }
    .footer {
      font-size: 12px;
      color: #888888;
      text-align: center;
      margin-top: 20px;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="logo">Agromart</div>
    <div class="message">
      Hello,<br>
      Your One Time Password (OTP) to verify your email with <strong>Agromart</strong> is:
    </div>
    <div class="otp-box">{{OTP}}</div>
    <div class="message">
      This OTP is valid for 10 minutes. Please do not share it with anyone.
    </div>
    <div class="footer">
      &copy; 2025 Agromart. All rights reserved.
    </div>
  </div>
</body>
</html>`;

module.exports=OTP_template;