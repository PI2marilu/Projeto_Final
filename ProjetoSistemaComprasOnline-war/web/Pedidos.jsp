

<%@page import="java.util.ArrayList"%>
<%@page import="entidade.Pedidos"%>
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
    
    <script>
function pagar(){
    

            var identrega = document.FormPagamento.idEntrega.value;
            var pagamento = document.FormPagamento.Pagamento.value;
            
            if (identrega != "" && pagamento != "") {
                alert("Pagamento Realizado com Sucesso!");
                
            }
}
</script>

    <%

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        List<Pedidos> listaPedidos = (List<Pedidos>) request.getSession().getAttribute("listaPedidos");
        List<Pedidos> listaPedidosPendentes = (List<Pedidos>) request.getSession().getAttribute("listaPedidosPendentes");
        List<Pedidos> listaPedidosFinalizados = (List<Pedidos>) request.getSession().getAttribute("listaPedidosFinalizados");


        String itensTotal;
        double valorTotal = 0;
        double valor = 0;
        DecimalFormat df = new DecimalFormat("#,###.00");



        if (!request.getSession().getAttribute("itensTotal").toString().equals("0")) {
            itensTotal = request.getSession().getAttribute("itensTotal").toString();
        } else {
            itensTotal = "0";
        }

        if (listaPedidosPendentes != null) {
        } else {
            listaPedidosPendentes = new ArrayList<Pedidos>();

        }

        if (listaPedidosFinalizados != null) {
        } else {
            listaPedidosFinalizados = new ArrayList<Pedidos>();

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

                        <h4>Meus Pedidos</h4>

                        <!-- Products -->
                        <div class="products">




                            <%if (listaPedidos != null && !listaPedidos.isEmpty()) {

                                    for (int w = 0; w < listaPedidos.size(); w++) {

                                        if (listaPedidos.get(w).getStatus().equals("AGUARDANDO PAGAMENTO")) {

                                            listaPedidosPendentes.add(listaPedidos.get(w));

                                        }
                                        if (!listaPedidos.get(w).getStatus().equals("AGUARDANDO PAGAMENTO")) {

                                            listaPedidosFinalizados.add(listaPedidos.get(w));



                                        }
                                    }
                                    if (listaPedidosPendentes != null && !listaPedidosPendentes.isEmpty()) {


                            %>                                    
                            <table border ="2p">     
                                <tr><td>Pagamentos Pendentes</td><td></td><td></td><td></td><td></td></tr>
                                <tr>
                                    <td>
                                        DATA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td>
                                        ID PRODUTO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>

                                    <td>
                                        QTD PRODUTOS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>

                                    <td>
                                        STATUS &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>

                                    <td>
                                        VALOR TOTAL &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>

                                </tr>

                                <%

                                    for (int i = 0; i < listaPedidosPendentes.size(); i++) {

                                            
                                        valor = Double.parseDouble(listaPedidosPendentes.get(i).getValorTotal());
                                        valorTotal = valor + valorTotal;

                                %>

                                <TR>
                                    <TD><%=String.valueOf(listaPedidosPendentes.get(i).getData())%></TD>
                                    <TD><%=String.valueOf(listaPedidosPendentes.get(i).getIdProduto())%></TD>
                                    <TD><%=String.valueOf(listaPedidosPendentes.get(i).getQuantidade())%></TD>
                                    <TD><%=String.valueOf(listaPedidosPendentes.get(i).getStatus())%></TD>
                                    <TD><%=String.valueOf(df.format(Double.parseDouble(listaPedidosPendentes.get(i).getValorTotal())))%></TD>

                                </TR> 




                                <%
                                    }
                                %>

                                <form action="EfetuarPagamento" name="FormPagamento"method="post">

                                    <tr>

                                        <td> Forma de pagamento: </td>
                                        <td>
                                            <select name="Pagamento" align="right" required="true">
                                                <option/>
                                                <option value="Boleto">Boleto</option>
                                                <option value="Cartao">Cartao</option>
                                            </select>
                                        </td>
                                        <td> Endereço de Entrega: </td>
                                        <td>
                                            <select name="idEntrega" align="right" required="true">
                                                <option/>
                                                <option value="meuEndereco">Meu Endereço: <%=usuario.getEndereco1()%> , <%=usuario.getNumero1()%> CEP: <%=usuario.getCep()%>  </option>
                                                <option value="amigoEndereco"> Endereço p/presente: <%=usuario.getEndereco2()%>  , <%=usuario.getNumero2()%> CEP: <%=usuario.getCep2()%> </option>
                                            </select>
                                           
                                     </td>
                                                            <td>  Total a pagar $<%=df.format(valorTotal)%>&nbsp; <input type="submit" value="Pagar" onClick="pagar();"/> </td> 
                                                            </tr>

                                     </form>

                                                            </table>
                                                            <%


                                                                    request.getSession().setAttribute("listaPedidosPendentes", null);
                                                                }


                                                            %>
                                                        </br>  
                                                        <%

                                                            if (listaPedidosFinalizados != null && !listaPedidosFinalizados.isEmpty()) {


                                                                for (int n = 0; n < listaPedidosFinalizados.size(); n++) {
                                                                    int y = n;
                                                                    y++;
                                                                    if (y < listaPedidosFinalizados.size()) {


                                                                        if (String.valueOf(String.valueOf(listaPedidosFinalizados.get(n).getData()).substring(0, 10) + String.valueOf(listaPedidosFinalizados.get(n).getData()).substring(20)).equals(String.valueOf(String.valueOf(listaPedidosFinalizados.get(y).getData()).substring(0, 10) + String.valueOf(listaPedidosFinalizados.get(y).getData()).substring(20)))
                                                                                && listaPedidosFinalizados.get(n).getStatus().equals(listaPedidosFinalizados.get(y).getStatus())) {

                                                                            int quantidadeTotal = listaPedidosFinalizados.get(n).getQuantidade() + listaPedidosFinalizados.get(y).getQuantidade();
                                                                            listaPedidosFinalizados.get(n).setQuantidade(quantidadeTotal);
                                                                            listaPedidosFinalizados.get(n).setValorTotal(String.valueOf(Double.parseDouble(listaPedidosFinalizados.get(n).getValorTotal()) + Double.parseDouble(listaPedidosFinalizados.get(y).getValorTotal())));


                                                                            listaPedidosFinalizados.remove(y);
                                                                            n--;


                                                                        }
                                                                    } else {
                                                                        break;
                                                                    }
                                                                }

                                                        %>
                                                        <table border ="2p">     
                                                            <tr><td>Pedidos Finalizados</td><td></td><td></td><td></td><td></td></tr>
                                                            <tr>
                                                                <td>
                                                                    DATA DA COMPRA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                </td>

                                                                <td>
                                                                    QTD PRODUTOS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                </td>

                                                                <td>
                                                                    STATUS &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                </td>

                                                                <td>
                                                                    VALOR TOTAL &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                </td>
                                                                <td>
                                                                    PRAZO DE ENTREGA &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                </td>

                                                            </tr>

                                                            <%


                                                                for (int k = 0; k < listaPedidosFinalizados.size(); k++) {%>


                                                            <TR>
                                                                <TD><%=String.valueOf(listaPedidosFinalizados.get(k).getData())%></TD>
                                                                <TD><%=listaPedidosFinalizados.get(k).getQuantidade()%></TD>
                                                                <TD><%=listaPedidosFinalizados.get(k).getStatus()%></TD>
                                                                <TD>$<%=String.valueOf(df.format(Double.parseDouble(listaPedidosFinalizados.get(k).getValorTotal())))%></TD>
                                                                <%if(!listaPedidosFinalizados.get(k).getStatus().equals("ENTREGUE")){%>
                                                                <TD>DE 3 À 7 DIAS UTEIS APOS CONFIRMAÇÃO DE PAGAMENTO</TD>
                                                                <%}else{%>
                                                                 <TD>RECEBIDO</TD>
                                                                <%}%>
                                                            </TR> 


                                                            <%   }%>



                                                        </table>

                                                        <%  request.getSession().setAttribute("listaPedidosFinalizados", null);
                                }
                            } else {%>
                                                        <h1 id="table1">Você não possui nenhum pedido!</h1>
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