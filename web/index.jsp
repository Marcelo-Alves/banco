<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta Bancos</title>
        <style>
            #geral{
                width:400px; 
                margin: 0 auto;
            }
            
            #geral label{
                width: 190px;   
                padding-bottom: 5px;
            }
            #geral input text{
                width: 180px;
                padding-bottom: 5px;
            }
            #geral select{
                width: 180px;
                padding-bottom: 5px;
            }
        </style>
    </head>
    <body>
        
        <div id="geral">
            <h1>Configuração de Banco</h1>
            <form action="painel.jsp" method="post">

                <label>Servidor</label> <br />
                <labe><input type="text" name="nome_servidor" id="nome_servidor" /></labe>
                <br />
                <label>Bancos</label> <br />
                <labe>
                    <select id="banco" name="banco">
                        <option>Selecione o  banco</option>
                        <option value="mysql">Mysql</option>
                        <option value="oracle">Oracle</option>
                    </select>
                </labe>
                <br />
                <label>Usuário</label>
                <br />
                <labe><input type="text" name="nome_usuario" id="nome_usuario" /></labe>
                <br />
                <label>Senha</label> 
                <br />
                <labe><input type="password" name="senha" id="senha" /></labe>
                <br />
                <labe><input type="submit" value="Enviar" /></labe>
                <br />
            </form>    
        </div>
    </body>
</html>
