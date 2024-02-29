
## Prueba Tecnica Salesland

pasos para ejecutar el servidor




## Ejecutar los SQL

```bash
Dentro de la carpeta store estan los archivos sql

Ejecutar en el siguiente orden :

1. migration.sql
2. sp_altaLead.sql
3. sp_disociar.sql
4. sp_vDisociados.sql
5. sp_recargar.sql
```



## Variables de entorno


```bash
  copy .env.example .env
```

## Iniciar servidor

```bash
 npm install
 ```

 ```bash
 npm run dev or npm run start
 ```

 ### El endpoint es :

 ```bash
 http://localhost:5000/api/ws_salesland_leads/altaLead
 metodo : POST
 body : como el PDF adjuntado 
 ```

 
## Tech Stack

**Server:** Node 16, Express, Mysql

