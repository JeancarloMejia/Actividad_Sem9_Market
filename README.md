# Actividad_Sem9_Market (Backend)

---

## Descripción

Proyecto backend desarrollado en **Spring Boot** como parte de la actividad de la semana 9.  
Expone una API REST para la gestión de productos de un mercado, consumida por el frontend en React.

---

## Funcionalidades

- CRUD completo de productos (`/products`)
- Búsqueda por ID y por categoría
- Mapeo de entidades a modelo de dominio con **MapStruct**
- Inserción automática de datos de ejemplo mediante `data.sql`
- Documentación interactiva con **Swagger UI** (springdoc-openapi)

---

## Tecnologías

- Java 21
- Spring Boot 3
- Spring Data JPA
- PostgreSQL (Render)
- Docker (multi-stage build para deploy)
- Maven

---

## Endpoints principales

Base URL (Render):

- `https://actividad-sem9-market.onrender.com`

Endpoints de productos:

- `GET /products/all`
- `GET /products/{id}`
- `GET /products/category/{categoryId}`
- `POST /products/save`
- `PUT /products/update/{id}`
- `DELETE /products/delete/{id}`

Ejemplo directo:

- [https://actividad-sem9-market.onrender.com/products/all](https://actividad-sem9-market.onrender.com/products/all)

---

## Documentación de la API

- Swagger UI:  
  [https://actividad-sem9-market.onrender.com/swagger-ui/index.html#/](https://actividad-sem9-market.onrender.com/swagger-ui/index.html#/)

- OpenAPI JSON (api-docs):  
  [https://actividad-sem9-market.onrender.com/v3/api-docs](https://actividad-sem9-market.onrender.com/v3/api-docs)

---

## Arquitectura y persistencia

- Capa **web**: controladores REST (`/products`)
- Capa **domain**: servicios y modelos (`Product`, `Category`)
- Capa **persistence**: entidades JPA (`Producto`, `Categoria`, etc.), repositorios y mappers
- Persistencia en **PostgreSQL** hosteado en Render
- Generación de tablas con JPA (`ddl-auto=create-drop`)
- Carga de datos iniciales con `src/main/resources/data.sql`

---

## Configuración clave (`application.properties`)

El backend se configura con variables de entorno (Render o `.env` local):

```properties
spring.application.name=TpIntegrado
server.port=${PORT:8080}

spring.datasource.url=${DB_URL}
spring.datasource.username=${DB_USER}
spring.datasource.password=${DB_PASSWORD}

spring.jpa.hibernate.ddl-auto=create-drop
spring.jpa.database-platform=org.hibernate.dialect.PostgreSQLDialect
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true

spring.jpa.defer-datasource-initialization=true
spring.sql.init.mode=always
```

Variables esperadas:

- `DB_URL` → JDBC de PostgreSQL en Render
- `DB_USER` → usuario de la base
- `DB_PASSWORD` → contraseña de la base

---

## Instalación y ejecución local

Requisitos:

- Java 21
- Maven
- PostgreSQL en Render (ya configurado)

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/JeancarloMejia/Actividad_Sem9_Market.git
   cd Actividad_Sem9_Market
   ```

2. Crear archivo `.env` en la raíz del proyecto:

   ```env
   DB_URL=jdbc:postgresql://TU_HOST_RENDER:5432/TU_DB
   DB_USER=TU_USUARIO
   DB_PASSWORD=TU_PASSWORD
   ```

3. Ejecutar la aplicación:

   ```bash
   ./mvnw spring-boot:run
   ```

   API local (por ejemplo):  
   `http://localhost:8080/products/all`

---

## Deploy en Render

- Backend empaquetado con **Dockerfile** multi-stage usando Maven y Eclipse Temurin.
- Web Service configurado en Render con:
    - Language: `Docker`
    - Branch: `main`
    - Variables de entorno: `DB_URL`, `DB_USER`, `DB_PASSWORD`
- Base de datos PostgreSQL creada como servicio administrado de Render en la misma región.

URL de producción (API):

- `https://actividad-sem9-market.onrender.com`

---

## Frontend relacionado

Proyecto frontend (React + Vite) que consume esta API:

- Repositorio:  
  [https://github.com/JeancarloMejia/Actividad_Sem9_Market_Fronted](https://github.com/JeancarloMejia/Actividad_Sem9_Market_Fronted)

- Deploy en Vercel:  
  [https://actividad-sem9-market.vercel.app](https://actividad-sem9-market.vercel.app)

---

## Nota

Proyecto realizado para el curso de **Desarrollo Web Integrado**, como evidencia completa de despliegue backend en Render (Spring Boot + PostgreSQL) y consumo de la API desde un frontend React hosteado en Vercel.