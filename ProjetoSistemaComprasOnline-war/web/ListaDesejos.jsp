

<%@page import="entidade.Produtos"%>
<%@page import="entidade.ListaDesejoUsuario"%>
<%@page import="java.util.List"%>
<%@page import="entidade.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml" dir="ltr">

    <%

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        List<Produtos> listaProdutos = (List<Produtos>) request.getSession().getAttribute("listaProdutos");
        List<ListaDesejoUsuario> listaDesejoSessao = (List<ListaDesejoUsuario>) request.getSession().getAttribute("listaDesejoSessao");
        
          String itensTotal = "0";
    
      if(request.getSession().getAttribute("itensTotal")!=null){
           itensTotal =  request.getSession().getAttribute("itensTotal").toString();
      }

    %>
    <head>
        <title>ProjetoSistemaComprasOnline</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" href="css/images/favicon.ico" />
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
        <script src="js/jquery.jcarousel.js" type="text/javascript"></script>
        <script src="js/DD_belatedPNG-min.js" type="text/javascript"></script>
        <script src="js/cufon-yui.js" type="text/javascript"></script>	
        <script src="js/Tahoma_400-Tahoma_700.font.js" type="text/javascript"></script>
        <script src="js/functions.js" type="text/javascript"></script>		
    </head>


    <body>
        <!-- Wrapper -->
        <div id="wrapper">
            <div class="shell">
                <!-- Header -->
                <div id="header">
                    <!-- Logo -->
                    <h1 id="logo"><a title="home" href="index.jsp">Sun Glasses</a></h1>
                    <!-- Navigation -->
                    <div id="navigation">

                        <% if (usuario == null) {%>
                        <ul>
                            <li><a title="Home" href="index.jsp">Home<span></span></a></li>
                            <li><a title="Catalog" href="ConsultaCatalog">Catalog<span></span></a></li>
                        </ul>

                        <%} else {%>

                        <ul>
                            <li><a title="Home" href="Home.jsp">Home<span></span></a></li>
                            <li><a title="Atualizar Dados" href="AtualizarPerfil.jsp">Atualizar Dados<span></span></a></li>
                            <li><a title="Catalog" href="ConsultaCatalog">Catalog<span></span></a></li>
                            <li><a title="Lista de Desejos" href="ConsultaListaDesejo">Lista de Desejos<span></span></a></li>
                             <li><a title="Meu Carrinho" href="ConsultaMeuCarrinho">Meu Carrinho<span></span></a></li>
                             <li><a title="Pedidos" href="ConsultaPedidos">Pedidos<span></span></a></li>

                        </ul>

                        <%}%>
                    </div>
                    <!-- END Navigation -->
                    <div class="cl"></div>
                    <div id="cart">
                        <p><a title="Meu Carrinho" href="ConsultaMeuCarrinho">Meu Carrinho:&nbsp; <%=itensTotal%> items</a></p>


                        <% if (usuario == null) {%>
                        <p><form action="ValidaNome" method="post">
                                Email:&nbsp;&nbsp;<input type="text" name="Email" required="true" size="20"/>
                                Senha:     <input type="password" name="Senha" required="true" size="10"/> 
                                <input type="submit" name="LOGIN" value="LOGIN"/>
                            </form>
                        </p>
                        <p><a title="Cadastre-se!" href="Cadastrar.jsp">Cadastre-se!</a></p>
                        <%} else {%>

                        <p>Bem-vindo <%=usuario.getApelido()%>
                            </form>
                        </p>
                        <p><a title="Sair" href="Sair.jsp">Fazer Logoff!</a></p>
                        <%}%>

                    </div>
                </div>	
            </div>
            <!-- END Header -->
            <!-- Main -->
            <div id="main">
                  <!-- Featured Items -->
                <div class="items">
                    <div class="shell">
                        
                        <h4>Minha Lista de Desejos</h4>
                        <!-- Products -->
                        <div class="products">
                
                        <%
                            if (listaDesejoSessao != null && !listaDesejoSessao.isEmpty()) {
                                for (int i = 0; i < listaDesejoSessao.size(); i++) {
                                    
                                     if (listaProdutos != null && !listaProdutos.isEmpty()) {

                                            for (int j = 0; j <= listaProdutos.size(); j++) {
                                                
                                             if (listaProdutos.get(j).getId() == Long.parseLong(listaDesejoSessao.get(i).getIdProduto())) {
                        %>

              
                        
                            <div class="product-frame">
                                <div class="product">
                                    <a title="Comprar" class="view-button" href="ValidaUsuarioCompraLista?idProduto=<%=listaProdutos.get(j).getId()%>&idProcesso=carrinho&quantidade=1&valor=<%=listaProdutos.get(j).getPreco()%>">Comprar</a>
                                    <div class="img-holder">	
                                        <a title="Comprar" href="ValidaUsuarioCompraLista?idProduto=<%=listaProdutos.get(j).getId()%>&idProcesso=carrinho&quantidade=1&valor=<%=listaProdutos.get(j).getPreco()%>">
                                            <%if(listaProdutos.get(j).getId()<=10){%>
                                            <img src="css/images/<%=String.valueOf(listaDesejoSessao.get(i).getIdProduto())%>.jpg" alt="Images of sunglasses" /></a>
                                            <%}else{%>
                                             <img src="css/images/ind.jpg" alt="Imagem indisponivel" /></a>
                                            <%}%>
                                    </div>								
                                    <div class="img-bottom"></div>
                                    <div class="price-box">
                                        <p>price</p>
                                        <p class="price"><span class="dollar">$</span><%=String.valueOf(listaProdutos.get(j).getPreco())%></sup></p>
                                    </div>
                                    <div class="product-entry">
                                        <p class="model"><%=String.valueOf(listaProdutos.get(j).getModelo())%></p>
                                        <p class="model"><span>product: <%=String.valueOf(listaProdutos.get(j).getId())%></span></p>
                                       <p class="product-info"><%=String.valueOf(listaProdutos.get(j).getDescricao())%> 
                                           <span id="link"><a href="RemoveListaDesejo?idLista=<%=listaDesejoSessao.get(i).getId()%>"></br>- Remover da minha lista de desejos!</a></span>
                                        </p>  
                                    </div>
                                </div>
                            </div>

                        
                        
                              <%break;
                                            }
                                        }
                                     }
                                 }     
                            }else{%>
                <h1 id="table1">Você não possui nenhum item na lista!</h1>
                <%}%>
                           <div class="cl"></div>
                        </div>
                        <!-- END Products -->
                    </div>
                </div>
                <!-- END Featured Items -->

             
            </div>
            <!-- END Main  -->
            <div id="footer-push"></div>
        </div>
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