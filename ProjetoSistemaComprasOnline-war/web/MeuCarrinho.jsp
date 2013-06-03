

<%@page import="javax.sound.midi.SysexMessage"%>
<%@page import="entidade.Produtos"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="entidade.MeuCarrinho"%>
<%@page import="java.util.List"%>
<%@page import="entidade.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml" dir="ltr">

    <%

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        List<MeuCarrinho> listaMeuCarrinho = (List<MeuCarrinho>) request.getSession().getAttribute("listaMeuCarrinho");
        List<Produtos> listaProdutos = (List<Produtos>) request.getSession().getAttribute("listaProdutos");
        String itensTotal;
        double valorTotal = 0;
        double valor = 0;
        DecimalFormat df = new DecimalFormat("#,###.00");

        if (!request.getSession().getAttribute("itensTotal").toString().equals("0")) {
            itensTotal = request.getSession().getAttribute("itensTotal").toString();
        } else {
            itensTotal = "0";
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
                        <%
                            if (listaMeuCarrinho != null && !listaMeuCarrinho.isEmpty()) {
                                for (int i = 0; i < listaMeuCarrinho.size(); i++) {

                                    valor = Double.parseDouble(listaMeuCarrinho.get(i).getValorTotal());
                                    valorTotal = valor + valorTotal;
                        %>


                        <%        }

                            session.setAttribute("valorTotal", valorTotal);%>
                        <h4>Meu Carrinho
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Total a pagar $<%=df.format(valorTotal)%>
                            <a  title="Finalizar Compra" href="FinalizaCarrinhoIncluiPedido" onClick="return confirm('Deseja finalizar a compra com <%=itensTotal%> item(s) no valor total de $<%=df.format(valorTotal)%> ?');">   Finalizar Compra</a>
                        </h4>
                        <%
                        } else {

                            session.setAttribute("valorTotal", 0);
                        %>
                        <h4>Meu Carrinho
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Total a pagar $0.00</h4>
                            <% }%>

                        <!-- Products -->
                        <div class="products">

                            <%
                                if (listaMeuCarrinho != null && !listaMeuCarrinho.isEmpty()) {
                                    
                                    for (int i = 0; i < listaMeuCarrinho.size(); i++) {
                                        
                                        if (listaProdutos != null && !listaProdutos.isEmpty()) {
                                            
                                            for (int j = 0; j < listaProdutos.size(); j++) {
                                                
                                                //System.out.print(listaProdutos.get(j).getId() + "==" + Long.parseLong(listaMeuCarrinho.get(i).getIdProduto()));

                                                if (listaProdutos.get(j).getId() == Long.parseLong(listaMeuCarrinho.get(i).getIdProduto())) {

                            %>

                           

                            <div class="product-frame">
                                <div class="product">

                                    <div class="img-holder">	
                                        <a title="Comprar" href="#">
                                          <%if(listaProdutos.get(j).getId()<=10){%>
                                            <img src="css/images/<%=String.valueOf(listaMeuCarrinho.get(i).getIdProduto())%>.jpg" alt="Images of sunglasses" /></a>
                                            <%}else{%>
                                             <img src="css/images/ind.jpg" alt="Imagem indisponivel" /></a>
                                            <%}%>
                                    </div>								
                                    <div class="img-bottom"></div>


                                    <div class="price-box">
                                        <p>price</p>
                                        <p class="price"><span class="dollar">$</span><%=listaProdutos.get(j).getPreco()%></p>
                                    </div>
                                    <div class="product-entry">
                                        <p class="model"><%=listaProdutos.get(j).getModelo()%></p>
                                        <p class="model"><span>product: <%=String.valueOf(listaProdutos.get(j).getId())%></span></p>
                                        <p class="model"><span>quantidade: <%=listaMeuCarrinho.get(i).getQuantidade()%></span></p>
                                        <p class="model"><span>valor total: $<%=df.format(listaMeuCarrinho.get(i).getQuantidade() * Double.parseDouble(listaProdutos.get(j).getPreco()))%></span></p>
                                        <p class="product-info"><%=listaProdutos.get(j).getDescricao()%> 
                                            <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=<%=listaProdutos.get(j).getId()%>&idProcesso=carrinho&quantidade=1&valor=<%=listaProdutos.get(j).getPreco()%>"></br>+ Adicionar mais um no Meu Carrinho!</a></span>
                                            <span id="link"><a href="RemoveMeuCarrinho?idLista=<%=listaMeuCarrinho.get(i).getId()%>"></br>- Remover este produto do Meu Carrinho!</a></span>
                                        </p>  
                                    </div>



                                </div>
                            </div>



                            <%    break;
                                            }
                                        }
                                    }

                                }
                            } else {%>
                            <h1 id="table1">Você não possui nenhum item no seu carrinho!</h1>
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