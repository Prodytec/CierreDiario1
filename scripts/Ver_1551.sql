ALTER PROCEDURE [DBO].[VERSIONBD] AS
SELECT 15.51 AS VERSION
GO

ALTER PROCEDURE [dbo].[SP_SALDOSPROVEEDORES]

AS
BEGIN


SELECT CTACTEPRV.IDPROVEEDOR AS CLIENTE, PROVEEDORES.NOMBRE AS NOMBRE, cast(round(SUM(DBO.VMONEDA(IMPORTE,CTACTEPRV.IDMONEDA,'001' ,CTACTEPRV.COTIZACION)),1)as integer) SALDO
FROM CTACTEPRV
LEFT JOIN PROVEEDORES ON CTACTEPRV.IDPROVEEDOR = PROVEEDORES.IDPROVEEDOR
WHERE NTIPO=0
GROUP BY CTACTEPRV.IDPROVEEDOR, PROVEEDORES.NOMBRE
HAVING SUM(IMPORTE)<>0
ORDER BY SUM(DBO.VMONEDA(IMPORTE,CTACTEPRV.IDMONEDA,'001' ,CTACTEPRV.COTIZACION))  DESC

END

GO

ALTER PROCEDURE [dbo].[SP_SALDOSCLIENTES]


AS
BEGIN

SELECT CTACTECLI.IDCLIENTE AS CLIENTE, CLIENTES.NOMBRE AS NOMBRE ,cast(round(SUM(DBO.VMONEDA(IMPORTE,CTACTECLI.IDMONEDA,'001' ,CTACTECLI.COTIZACION)),1)as integer) SALDO
FROM CTACTECLI
LEFT JOIN CLIENTES ON CTACTECLI.IDCLIENTE = CLIENTES.IDCLIENTE
WHERE NTIPO=0 
GROUP BY CTACTECLI.IDCLIENTE, CLIENTES.NOMBRE
HAVING SUM(IMPORTE)<>0
ORDER BY SUM(DBO.VMONEDA(IMPORTE,CTACTECLI.IDMONEDA,'001' ,CTACTECLI.COTIZACION)) DESC

END