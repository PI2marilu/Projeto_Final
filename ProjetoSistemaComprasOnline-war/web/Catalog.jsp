

<%@page import="entidade.Produtos"%>
<%@page import="java.util.List"%>
<%@page import="entidade.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml" dir="ltr">

    <%

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        List<Produtos> listaProdutosCatalog = (List<Produtos>) request.getSession().getAttribute("listaProdutosCatalog");
          String itensTotal = "0";
    
      if(request.getSession().getAttribute("itensTotal")!=null){
           itensTotal = request.getSession().getAttribute("itensTotal").toString();
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
                         <% if (usuario == null) {%>
                        <p><a title="Meu Carrinho" href="Login.jsp">Meu Carrinho:&nbsp; <%=itensTotal%> items</a></p>
                        <%} else {%>
                        <p><a title="Meu Carrinho" href="ConsultaMeuCarrinho">Meu Carrinho:&nbsp; <%=itensTotal%> items</a></p>
                        <%}%>

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
                        <h4>Nossos Produtos</h4>

                         <!-- Products -->
                            <div class="products">
                                <div class="product-frame">
                                    <div class="product">
                                        <a title="Comprar" class="view-button" href="ValidaUsuarioCompraLista?idProduto=1&idProcesso=carrinho&quantidade=1&valor=155.99">Comprar</a>
                                        <div class="img-holder">	
                                            <a title="Comprar" href="ValidaUsuarioCompraLista?idProduto=1&idProcesso=carrinho&quantidade=1&valor=159.99"><img src="css/images/1.jpg" alt="Images of sunglasses" /></a>
                                        </div>								
                                        <div class="img-bottom"></div>
                                        <div class="price-box">
                                            <p>price</p>
                                            <p class="price"><span class="dollar">$</span>155<sup>.99</sup></p>
                                        </div>
                                        <div class="product-entry">
                                            <p class="model">Sunglasses<br /> Model</p>
                                            <p class="model"><span>product: 1</span></p>
                                            <p class="product-info">Sed at fringilla est. Donec ac mi augue. Mauris id sem at felis sollicitudin sollicitudin. 
                                                <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=1&idProcesso=desejo&quantidade=1&valor=155.99"></br>+ Adicionar a minha lista de desejos!</a></span>
                                                <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=1&idProcesso=carrinho&quantidade=1&valor=155.99"></br>+ Adicionar ao meu carrinho!</a></span>
                                            </p>  
                                        </div>
                                    </div>
                                </div>
                                <div class="product-frame">
                                    <div class="product">
                                        <a title="Comprar" class="view-button" href="ValidaUsuarioCompraLista?idProduto=2&idProcesso=carrinho&quantidade=1&valor=129.99">Comprar</a>
                                        <div class="img-holder">	
                                            <a title="Comprar" href="ValidaUsuarioCompraLista?idProduto=2&idProcesso=carrinho&quantidade=1&valor=129.99"><img src="css/images/2.jpg" alt="Images of sunglasses" /></a>
                                        </div>								
                                        <div class="img-bottom"></div>
                                        <div class="price-box">
                                            <p>price</p>
                                            <p class="price"><span class="dollar">$</span>129<sup>.99</sup></p>
                                        </div>
                                        <div class="product-entry">
                                            <p class="model">Sunglasses<br /> Model</p>
                                            <p class="model"><span>product: 2</span></p>
                                            <p class="product-info">Sed at fringilla est. Donec ac mi augue. Mauris id sem at felis sollicitudin sollicitudin. 
                                                <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=2&idProcesso=desejo&quantidade=1&valor=129.99"></br>+ Adicionar a minha lista de desejos!</a></span>
                                                <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=2&idProcesso=carrinho&quantidade=1&valor=129.99"></br>+ Adicionar ao meu carrinho!</a></span>
                                            </p>  
                                        </div>
                                    </div>
                                </div>
                                <div class="product-frame">
                                    <div class="product">
                                        <a title="Comprar" class="view-button" href="ValidaUsuarioCompraLista?idProduto=3&idProcesso=carrinho&quantidade=1&valor=249.99">Comprar</a>
                                        <div class="img-holder">	
                                            <a title="Comprar" href="ValidaUsuarioCompraLista?idProduto=3&idProcesso=carrinho&quantidade=1&valor=249.99"><img src="css/images/3.jpg" alt="Images of sunglasses" /></a>
                                        </div>								
                                        <div class="img-bottom"></div>
                                        <div class="price-box">
                                            <p>price</p>
                                            <p class="price"><span class="dollar">$</span>249<sup>.99</sup></p>
                                        </div>
                                        <div class="product-entry">
                                            <p class="model">Sunglasses<br /> Model</p>
                                            <p class="model"><span>product: 3</span></p>
                                            <p class="product-info">Sed at fringilla est. Donec ac mi augue. Mauris id sem at felis sollicitudin sollicitudin. 
                                                <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=3&idProcesso=desejo&quantidade=1&valor=249.99"></br>+ Adicionar a minha lista de desejos!</a></span>
                                                <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=3&idProcesso=carrinho&quantidade=1&valor=249.99"></br>+ Adicionar ao meu carrinho!</a></span>
                                            </p>  
                                        </div>
                                    </div>
                                </div>
                                <div class="product-frame">
                                    <div class="product">
                                        <a title="Comprar" class="view-button" href="ValidaUsuarioCompraLista?idProduto=4&idProcesso=carrinho&quantidade=1&valor=99.99">Comprar</a>
                                        <div class="img-holder">	
                                            <a title="Comprar" href="ValidaUsuarioCompraLista?idProduto=4&idProcesso=carrinho&quantidade=1&valor=99.99"><img src="css/images/4.jpg" alt="Images of sunglasses" /></a>
                                        </div>								
                                        <div class="img-bottom"></div>
                                        <div class="price-box">
                                            <p>price</p>
                                            <p class="price"><span class="dollar">$</span>99<sup>.99</sup></p>
                                        </div>
                                        <div class="product-entry">
                                            <p class="model">Sunglasses<br /> Model</p>
                                            <p class="model"><span>product: 4</span></p>
                                            <p class="product-info">Sed at fringilla est. Donec ac mi augue. Mauris id sem at felis sollicitudin sollicitudin. 
                                                <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=4&idProcesso=desejo&quantidade=1&valor=99.99"></br>+ Adicionar a minha lista de desejos!</a></span>
                                                <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=4&idProcesso=carrinho&quantidade=1&valor=99.99"></br>+ Adicionar ao meu carrinho!</a></span>
                                            </p>  </div>
                                    </div>
                                </div>
                                <div class="product-frame">
                                    <div class="product">
                                        <a title="Comprar" class="view-button" href="ValidaUsuarioCompraLista?idProduto=5&idProcesso=carrinho&quantidade=1&valor=199.99">Comprar</a>
                                        <div class="img-holder">	
                                            <a title="Comprar" href="ValidaUsuarioCompraLista?idProduto=5&idProcesso=carrinho&quantidade=1&valor=199.99"><img src="css/images/5.jpg" alt="Images of sunglasses" /></a>
                                        </div>								
                                        <div class="img-bottom"></div>
                                        <div class="price-box">
                                            <p>price</p>
                                            <p class="price"><span class="dollar">$</span>199<sup>.99</sup></p>
                                        </div>
                                        <div class="product-entry">
                                            <p class="model">Sunglasses<br /> Model</p>
                                            <p class="model"><span>product: 5</span></p>
                                            <p class="product-info">Sed at fringilla est. Donec ac mi augue. Mauris id sem at felis sollicitudin sollicitudin. 
                                                <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=5&idProcesso=desejo&quantidade=1&valor=199.99"></br>+ Adicionar a minha lista de desejos!</a></span>
                                                <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=5&idProcesso=carrinho&quantidade=1&valor=199.99"></br>+ Adicionar ao meu carrinho!</a></span>
                                            </p>  
                                        </div>
                                    </div>
                                </div>
                                <div class="product-frame">
                                    <div class="product">
                                        <a title="Comprar" class="view-button" href="ValidaUsuarioCompraLista?idProduto=6&idProcesso=carrinho&quantidade=1&valor=284.99">Comprar</a>
                                        <div class="img-holder">	
                                            <a title="Comprar" href="ValidaUsuarioCompraLista?idProduto=6&idProcesso=carrinho&quantidade=1&valor=284.99"><img src="css/images/6.jpg" alt="Images of sunglasses" /></a>
                                        </div>								
                                        <div class="img-bottom"></div>
                                        <div class="price-box">
                                            <p>price</p>
                                            <p class="price"><span class="dollar">$</span>284<sup>.99</sup></p>
                                        </div>
                                        <div class="product-entry">
                                            <p class="model">Sunglasses<br /> Model</p>
                                            <p class="model"><span>product: 6</span></p>
                                            <p class="product-info">Sed at fringilla est. Donec ac mi augue. Mauris id sem at felis sollicitudin sollicitudin. 
                                                <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=6&idProcesso=desejo&quantidade=1&valor=284.99"></br>+ Adicionar a minha lista de desejos!</a></span>
                                                <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=6&idProcesso=carrinho&quantidade=1&valor=284.99"></br>+ Adicionar ao meu carrinho!</a></span>
                                            </p>   </div>
                                    </div>
                                    </div>
                            <div class="product-frame">
                                <div class="product">
                                    <a title="Comprar" class="view-button" href="ValidaUsuarioCompraLista?idProduto=7&idProcesso=carrinho&quantidade=1&valor=284.99">Comprar</a>
                                    <div class="img-holder">	
                                        <a title="Comprar" href="ValidaUsuarioCompraLista?idProduto=7&idProcesso=carrinho&quantidade=1&valor=284.99"><img src="css/images/7.jpg" alt="Images of sunglasses" /></a>
                                    </div>								
                                    <div class="img-bottom"></div>
                                    <div class="price-box">
                                        <p>price</p>
                                        <p class="price"><span class="dollar">$</span>284<sup>.99</sup></p>
                                    </div>
                                    <div class="product-entry">
                                        <p class="model">Sunglasses<br /> Model</p>
                                        <p class="model"><span>product: 7</span></p>
                                        <p class="product-info">Sed at fringilla est. Donec ac mi augue. Mauris id sem at felis sollicitudin sollicitudin. 
                                            <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=7&idProcesso=desejo&quantidade=1&valor=284.99"></br>+ Adicionar a minha lista de desejos!</a></span>
                                            <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=7&idProcesso=carrinho&quantidade=1&valor=284.99"></br>+ Adicionar ao meu carrinho!</a></span>

                                        </p>  
                                    </div>
                                </div>
                            </div>
                            <div class="product-frame">
                                <div class="product">
                                    <a title="Comprar" class="view-button" href="ValidaUsuarioCompraLista?idProduto=8&idProcesso=carrinho&quantidade=1&valor=284.99">Comprar</a>
                                    <div class="img-holder">	
                                        <a title="Comprar" href="ValidaUsuarioCompraLista?idProduto=8&idProcesso=carrinho&quantidade=1&valor=284.99"><img src="css/images/8.jpg" alt="Images of sunglasses" /></a>
                                    </div>								
                                    <div class="img-bottom"></div>
                                    <div class="price-box">
                                        <p>price</p>
                                        <p class="price"><span class="dollar">$</span>284<sup>.99</sup></p>
                                    </div>
                                    <div class="product-entry">
                                        <p class="model">Sunglasses<br /> Model</p>
                                        <p class="model"><span>product: 8</span></p>
                                        <p class="product-info">Sed at fringilla est. Donec ac mi augue. Mauris id sem at felis sollicitudin sollicitudin. 
                                            <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=8&idProcesso=desejo&quantidade=1&valor=284.99"></br>+ Adicionar a minha lista de desejos!</a></span>
                                            <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=8&idProcesso=carrinho&quantidade=1&valor=284.99"></br>+ Adicionar ao meu carrinho!</a></span>

                                        </p>  
                                    </div>
                                </div>
                            </div>
                            <div class="product-frame">
                                <div class="product">
                                    <a title="Comprar" class="view-button" href="ValidaUsuarioCompraLista?idProduto=9&idProcesso=carrinho&quantidade=1&valor=284.99">Comprar</a>
                                    <div class="img-holder">	
                                        <a title="Comprar" href="ValidaUsuarioCompraLista?idProduto=9&idProcesso=carrinho&quantidade=1&valor=284.99"><img src="css/images/9.jpg" alt="Images of sunglasses" /></a>
                                    </div>								
                                    <div class="img-bottom"></div>
                                    <div class="price-box">
                                        <p>price</p>
                                        <p class="price"><span class="dollar">$</span>284<sup>.99</sup></p>
                                    </div>
                                    <div class="product-entry">
                                        <p class="model">Sunglasses<br /> Model</p>
                                        <p class="model"><span>product: 9</span></p>
                                        <p class="product-info">Sed at fringilla est. Donec ac mi augue. Mauris id sem at felis sollicitudin sollicitudin. 
                                            <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=9&idProcesso=desejo&quantidade=1&valor=284.99"></br>+ Adicionar a minha lista de desejos!</a></span>
                                            <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=9&idProcesso=carrinho&quantidade=1&valor=284.99"></br>+ Adicionar ao meu carrinho!</a></span>

                                        </p>  
                                    </div>
                                </div>
                            </div>
                            <div class="product-frame">
                                <div class="product">
                                    <a title="Comprar" class="view-button" href="ValidaUsuarioCompraLista?idProduto=10&idProcesso=carrinho&quantidade=1&valor=284.99">Comprar</a>
                                    <div class="img-holder">	
                                        <a title="Comprar" href="ValidaUsuarioCompraLista?idProduto=10&idProcesso=carrinho&quantidade=1&valor=284.99"><img src="css/images/10.jpg" alt="Images of sunglasses" /></a>
                                    </div>								
                                    <div class="img-bottom"></div>
                                    <div class="price-box">
                                        <p>price</p>
                                        <p class="price"><span class="dollar">$</span>284<sup>.99</sup></p>
                                    </div>
                                    <div class="product-entry">
                                        <p class="model">Sunglasses<br /> Model</p>
                                        <p class="model"><span>product: 10</span></p>
                                        <p class="product-info">Sed at fringilla est. Donec ac mi augue. Mauris id sem at felis sollicitudin sollicitudin. 
                                            <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=10&idProcesso=desejo&quantidade=1&valor=284.99"></br>+ Adicionar a minha lista de desejos!</a></span>
                                            <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=10&idProcesso=carrinho&quantidade=1&valor=284.99"></br>+ Adicionar ao meu carrinho!</a></span>

                                        </p>  
                                    </div>
                                </div>
                            </div>
                                
                                <%if(listaProdutosCatalog!=null && !listaProdutosCatalog.isEmpty()){
                                    for(int i=0 ; i < listaProdutosCatalog.size() ; i++){
                                        
                                    
                                %>
                                
                                 <div class="product-frame">
                                <div class="product">
                                    <a title="Comprar" class="view-button" href="ValidaUsuarioCompraLista?idProduto=<%=listaProdutosCatalog.get(i).getId()%>&idProcesso=carrinho&quantidade=1&valor=<%=listaProdutosCatalog.get(i).getPreco()%>">Comprar</a>
                                    <div class="img-holder">	
                                        <a title="Comprar" href="ValidaUsuarioCompraLista?idProduto=<%=listaProdutosCatalog.get(i).getId()%>&idProcesso=carrinho&quantidade=1&valor=<%=listaProdutosCatalog.get(i).getPreco()%>"><img src="css/images/ind.jpg" alt="Imagem indisponivel" /></a>
                                    </div>								
                                    <div class="img-bottom"></div>
                                    <div class="price-box">
                                        <p>price</p>
                                        <p class="price"><span class="dollar">$</span><%=listaProdutosCatalog.get(i).getPreco()%></p>
                                    </div>
                                    <div class="product-entry">
                                        <p class="model"><%=listaProdutosCatalog.get(i).getModelo()%><br /> Model</p>
                                        <p class="model"><span>product: <%=listaProdutosCatalog.get(i).getId()%></span></p>
                                        <p class="product-info"><%=listaProdutosCatalog.get(i).getDescricao()%>
                                            <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=<%=listaProdutosCatalog.get(i).getId()%>&idProcesso=desejo&quantidade=1&valor=<%=listaProdutosCatalog.get(i).getPreco()%>"></br>+ Adicionar a minha lista de desejos!</a></span>
                                            <span id="link"><a href="ValidaUsuarioCompraLista?idProduto=<%=listaProdutosCatalog.get(i).getId()%>&idProcesso=carrinho&quantidade=1&valor=<%=listaProdutosCatalog.get(i).getPreco()%>"></br>+ Adicionar ao meu carrinho!</a></span>

                                        </p>  
                                    </div>
                                </div>
                            </div>
                                
                                
                                
                                <%
                                      }
                                    }%>
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