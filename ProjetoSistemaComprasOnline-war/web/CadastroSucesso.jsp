<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>ProjetoSistemaComprasOnline</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" href="css/images/favicon.ico" />
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />

    </head>

    <%
        String idProcesso = (String) request.getSession().getAttribute("idProcesso");
          String itensTotal = "0";
    
      if(request.getSession().getAttribute("itensTotal")!=null){
           itensTotal = request.getSession().getAttribute("itensTotal").toString();
      }
    %>

    <body>

        <div id="layout">
            <!-- Wrapper -->
            <div id="wrapper">
                <div class="shell">
                    <!-- Header -->
                    <div id="header">
                        <!-- Logo -->
                        <h1 id="logo"><a title="home" href="index.jsp">Sun Glasses</a></h1>
                        <!-- Navigation -->
                        <div id="navigation">
                            <ul>
                                <li><a title="Home" href="index.jsp">Home<span></span></a></li>
                                <li><a title="Catalog" href="ConsultaCatalog">Catalog<span></span></a></li>
                            </ul>
                        </div>
                        <!-- END Navigation -->
                        <div class="cl"></div>
                        <div id="cart">
                            <p><a title="Meu Carrinho" href="Login.jsp">Meu Carrinho:&nbsp; <%=itensTotal%> items</a></p>
                            <p><form action="ValidaNome" method="post">
                                Email:&nbsp;&nbsp;<input type="text" name="Email" required="true" size="20"/>
                                Senha:     <input type="password" name="Senha" required="true" size="10"/> 
                                <input type="submit" name="LOGIN" value="LOGIN"/>
                            </form>
                            </p>
                            <p><a title="Cadastre-se!" href="Cadastrar.jsp">Cadastre-se!</a></p>

                        </div>
                    </div>	
                </div>
                <!-- END Header -->


                <BR>
                <table id="table">
                    <tr><td>
                            <h1>Cadastro realizado com sucesso!</h1>
                            <div id="link">
                            <%if (idProcesso != null) {%>
                                 <%if (idProcesso.equals("desejo")) {%>
                            <a href="ConsultaListaDesejo"> Continuar a Minha Lista de Desejos</a>
                            
                            <%  request.getSession().setAttribute("idProduto", null);
                               request.getSession().setAttribute("idProcesso", null);
                                 }%>
                                 <%if (idProcesso.equals("carrinho")) {%>
                            <a href="ConsultaMeuCarrinho"> Continuar a Meu Carrinho</a>
                            <%   request.getSession().setAttribute("idProduto", null);
                            request.getSession().setAttribute("idProcesso", null);
                                }%>
                            <%} else {%>
                             <a href="index.jsp"> Voltar para página inicial</a>
                            <%}%>
                            </div>
                        </td></tr> 
                </table>

                <div id="footer-push"></div>

                <!-- END Wrapper -->
                <!-- Footer -->
                <div id="footer">
                    <div class="shell">
                        <div id="bottom-logo"><a title="home" href="index.jsp">Bottom logo</a></div>
                        <p>Copyright &copy; Mackenzie 2013. All Rights Reserved. </p>
                        <div class="cl"></div>
                    </div>
                </div>
                <!-- END Footer -->


                </body>
                </html>