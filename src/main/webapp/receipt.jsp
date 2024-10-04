<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Payment Receipt</title>
        <%@include file="components/links.jsp" %>
        <style type="text/css">
            table {
                border: 0;
            }
            table td {
                padding: 5px;
            }
        </style>
    </head>
    <body>
        <%@include file="components/header.jsp" %>
<!--        <div align="center">
            <h1>Payment Done. Thank you for purchasing our products</h1>
            <br/>
            <h2>Receipt Details:</h2>
            <table>
                <tr>
                    <td><b>Merchant:</b></td>
                    <td>Company ABC Ltd.</td>
                </tr>
                <tr>
                    <td><b>Payer:</b></td>
                    <td>${payer.firstName} ${payer.lastName}</td>      
                </tr>
                <tr>
                    <td><b>Description:</b></td>
                    <td>${transaction.description}</td>
                </tr>
                <tr>
                    <td><b>Subtotal:</b></td>
                    <td>${transaction.amount.details.subtotal} USD</td>
                </tr>
                <tr>
                    <td><b>Shipping:</b></td>
                    <td>${transaction.amount.details.shipping} USD</td>
                </tr>
                <tr>
                    <td><b>Tax:</b></td>
                    <td>${transaction.amount.details.tax} USD</td>
                </tr>
                <tr>
                    <td><b>Total:</b></td>
                    <td>${transaction.amount.total} USD</td>
                </tr>                    
            </table>
        </div>-->
                
        <div class="container">
        <div class="row">
            <div class="col-md-6">   

                <strong>Perú Inolvidable</strong><br>
                Dirección: Calle Falsa 123<br>
                Teléfono: 123456789
            </div>
            <div class="col-md-6 text-right">
                <strong>Recibo #12345</strong><br>
                Fecha: 2023-11-23<br>
                Cliente: ${payer.firstName} ${payer.lastName}
            </div>
        </div>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Concepto</th>
                    <th>Cantidad</th>
                    <th>Precio Unitario</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Producto A</td>
                    <td>2</td>
                    <td>$10.00</td>
                    <td>$20.00</td>
                </tr>
                <tr>
                    <td>Producto B</td>
                    <td>1</td>
                    <td>$15.00</td>
                    <td>$15.00</td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="3">Total</td>
                    <td>${transaction.amount.total} USD</td>
                </tr>
            </tfoot>
        </table>

        <div>
            <p>Gracias por su compra.</p>
            <p>Este recibo es un comprobante de pago.</p>
        </div>
    </div>

        <%@include file="components/footer.jsp" %>
    </body>
</html>