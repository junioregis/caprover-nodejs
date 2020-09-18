# Resume

NodeJS skeleton for [CapRover](https://caprover.com)

# Features

- Postgres ready
- Redis ready
- Selenium ready
- Backup implementation

## 1. Deploy to CapRover on VirtualBox

### 1.1. [Setup CapRover](https://github.com/junioregis/caprover-vps/wiki)

### 1.2. Set Hosts (Localhost)

```
192.168.56.10 captain.localhost
192.168.56.10 skeleton-app.captain.localhost
192.168.56.10 skeleton-postgres-admin.captain.localhost
```

### 1.3. Deploy

#### 1.3.1. Access:

[http://captain.localhost:3000](http://captain.localhost:3000)

#### 1.3.2. Create Services:

Apps > One-Click Apps/Databases > TEMPLATE > Paste content of `captain.template.yml` > Next > Set App name to `skeleton`

#### 1.3.3. Create a tarbal (.tar) of project

#### 1.3.4. Deploy:

Apps > skeleton-app > Deployment > Method 2: Tarball > Select Tarball > Click on Upload & Deploy

### 1.5. Test

App:

[http://skeleton-app.captain.localhost](http://skeleton-app.captain.localhost)

Database Admin:

[http://skeleton-postgres-admin.captain.localhost](http://skeleton-postgres-admin.captain.localhost)

| Host                           | Port | Username         | Password |
| ------------------------------ | ---- | ---------------- | -------- |
| srv-captain--skeleton-postgres | 5432 | admin@domain.com | admin    |
