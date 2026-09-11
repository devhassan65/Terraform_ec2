#!/bin/bash

# Update package index
dnf update -y

# Install NGINX
dnf install nginx -y

# Create colorful animated HTML page
cat > /usr/share/nginx/html/index.html <<'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terraform + AWS</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            color: white;
            overflow: hidden;
            background: linear-gradient(-45deg, #0f172a, #1e3a8a, #581c87, #0f766e);
            background-size: 400% 400%;
            animation: gradient 10s ease infinite;
        }

        @keyframes gradient {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }

        .container {
            text-align: center;
            padding: 50px;
            width: 90%;
            max-width: 800px;
            background: rgba(255, 255, 255, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.25);
            border-radius: 25px;
            backdrop-filter: blur(15px);
            box-shadow: 0 0 40px rgba(0, 0, 0, 0.4);
            animation: float 4s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-12px);
            }
        }

        h1 {
            font-size: 48px;
            margin-bottom: 15px;
            background: linear-gradient(90deg, #38bdf8, #a78bfa, #f472b6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        h2 {
            margin-bottom: 20px;
            font-weight: normal;
        }

        p {
            font-size: 18px;
            line-height: 1.6;
            margin-bottom: 25px;
        }

        .tech {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 12px;
            margin-top: 20px;
        }

        .badge {
            padding: 10px 18px;
            border-radius: 30px;
            background: rgba(255,255,255,0.15);
            border: 1px solid rgba(255,255,255,0.3);
            transition: 0.3s;
        }

        .badge:hover {
            transform: scale(1.1);
            background: rgba(255,255,255,0.3);
        }

        .status {
            margin-top: 30px;
            font-size: 20px;
            animation: pulse 1.5s infinite;
        }

        @keyframes pulse {
            0%, 100% {
                opacity: 1;
            }
            50% {
                opacity: 0.5;
            }
        }

        .footer {
            margin-top: 30px;
            font-size: 14px;
            opacity: 0.8;
        }
    </style>
</head>

<body>

    <div class="container">

        <h1>🚀 Infrastructure is Ready!</h1>

        <h2>Terraform + AWS + NGINX</h2>

        <p>
            This EC2 instance was automatically provisioned using
            <strong>Terraform</strong> and configured with
            <strong>User Data</strong>.
        </p>

        <div class="tech">
            <div class="badge">☁️ AWS EC2</div>
            <div class="badge">🏗️ Terraform</div>
            <div class="badge">🐧 Linux</div>
            <div class="badge">🌐 NGINX</div>
            <div class="badge">⚙️ DevOps</div>
        </div>

        <div class="status">
            🟢 Server is Running
        </div>

        <div class="footer">
            Automated Deployment • Infrastructure as Code
        </div>

    </div>

</body>
</html>
EOF

# Start NGINX
systemctl start nginx

# Enable NGINX on boot
systemctl enable nginx