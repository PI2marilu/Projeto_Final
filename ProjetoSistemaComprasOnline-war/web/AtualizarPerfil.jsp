<%@page import="entidade.Usuario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>ProjetoSistemaComprasOnline</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" href="css/images/favicon.ico" />
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />

    </head>

    <script type="text/javascript" >
        function validarSenha(){
            
            var senha = document.f1.Senha.value;
            var cSenha = document.f1.ConfirmaSenha.value;
            
            if (senha != cSenha) {
                alert("Senha não confere!!!");
                return false;
            }
            if(!ValidaEmail())
            {
                return false;
            }
            return true;
        }
        function validarEmail() {
            var email = document.f1.Email.value;
            
            if(email=="") {
                alert("É necessário o preenchimento deste campo.");		
                return false;
            }
	
            if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(document.f1.Email.value))) {
                alert("Email inválido!. Por favor para se cadastrar digite um eMail válido.");		
                return false;
            }
            return true
        }

    </script>

    <%

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

        String nome = usuario.getNome();
        String cpf = usuario.getCpf();
        String sexo = usuario.getSexo();
        String apelido = usuario.getApelido();
        String email = usuario.getEmail();
        String cidade = usuario.getCidade();
        String estado = usuario.getEstado();
        String cep = usuario.getCep();
        String endereco1 = usuario.getEndereco1();
        String numero1 = usuario.getNumero1();
        String complemento1 = usuario.getComplemento1();
        String cep2 = usuario.getCep2();
        String endereco2 = usuario.getEndereco2();
        String numero2 = usuario.getNumero2();
        String complemento2 = usuario.getComplemento2();
        
          String itensTotal = "0";
    
      if(request.getSession().getAttribute("itensTotal")!=null){
           itensTotal =  request.getSession().getAttribute("itensTotal").toString();
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
                                <li><a title="Home" href="Home.jsp">Home<span></span></a></li>
                                <li><a title="Atualizar Dados" href="AtualizarPerfil.jsp">Atualizar Dados<span></span></a></li>
                                <li><a title="Catalog" href="ConsultaCatalog">Catalog<span></span></a></li>
                                 <li><a title="Lista de Desejos" href="ConsultaListaDesejo">Lista de Desejos<span></span></a></li>
                                  <li><a title="Meu Carrinho" href="ConsultaMeuCarrinho">Meu Carrinho<span></span></a></li>
                                   <li><a title="Pedidos" href="ConsultaPedidos">Pedidos<span></span></a></li>

                            </ul>
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



                <form action="AtualizarPerfil" method="post" name="f1" align="center">

                    <h1>Atualizar Dados</h1> 

                    <div id="table">
                        <table>
                            <tr>
                                <td>
                                    Nome Completo:
                                </td>
                                <td>
                                    <input type="text" name="Nome" value="<%=nome%>" required="true"  size="40" />  
                                </td>
                            </tr>
                            <tr>
                                <td> CPF: </td>
                                <td><input type="text" name="CPF" value="<%=cpf%>" required="true" size="40" /></td>
                            </tr>


                            <tr>
                                <td>
                                    Sexo:
                                </td>
                                <td>
                                    <select name="Sexo" required="true">

                                        <option value='Masculino'<%= ("Masculino".equals(sexo)) ? ("selected='Masculino'") : ""%>>Masculino</option>
                                        <option value='Feminino'<%= ("Feminino".equals(sexo)) ? ("selected='Feminino'") : ""%>>Feminino</option>



                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Como gostaria de ser chamado?</td>
                                <td>
                                    <input type="text" name="Apelido" value="<%=apelido%>" required="true" size="40" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Email:
                                </td>
                                <td>
                                    <input type="text" name="Email" value="<%=email%>" required="true" onblur="validarEmail();"  size="40" />  
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    Nova senha:
                                </td>
                                <td>
                                    <input type="password" name="Senha" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Confirmar nova senha:
                                </td>
                                <td>
                                    <input type="password" name="ConfirmaSenha" />
                                </td>
                            </tr>

                            <tr>
                                <td> Cidade: </td>
                                <td><input type="text" name="Cidade" value="<%=cidade%>" required="true" size="40" /></td>
                            </tr>

                            <tr>
                                <td>
                                    Estado:
                                </td>
                                <td>
                                    <select name="Estado" required="true">

                                        <option value='AC'<%= ("AC".equals(estado)) ? ("selected='AC'") : ""%>>AC</option>
                                        <option value='AL'<%= ("AL".equals(estado)) ? ("selected='AL'") : ""%>>AL</option>
                                        <option value='AM'<%= ("AM".equals(estado)) ? ("selected='AM'") : ""%>>AM</option>
                                        <option value='AP'<%= ("AP".equals(estado)) ? ("selected='AP'") : ""%>>AP</option>
                                        <option value='BA'<%= ("BA".equals(estado)) ? ("selected='BA'") : ""%>>BA</option>
                                        <option value='CE'<%= ("CE".equals(estado)) ? ("selected='CE'") : ""%>>CE</option>
                                        <option value='DF'<%= ("DF".equals(estado)) ? ("selected='DF'") : ""%>>DF</option>
                                        <option value='ES'<%= ("ES".equals(estado)) ? ("selected='ES'") : ""%>>ES</option>
                                        <option value='GO'<%= ("GO".equals(estado)) ? ("selected='GO'") : ""%>>GO</option>
                                        <option value='MA'<%= ("MA".equals(estado)) ? ("selected='MA'") : ""%>>MA</option>
                                        <option value='MG'<%= ("MG".equals(estado)) ? ("selected='MG'") : ""%>>MG</option>
                                        <option value='MS'<%= ("MS".equals(estado)) ? ("selected='MS'") : ""%>>MS</option>
                                        <option value='MT'<%= ("MT".equals(estado)) ? ("selected='MT'") : ""%>>MT</option>
                                        <option value='PA'<%= ("PA".equals(estado)) ? ("selected='PA'") : ""%>>PA</option>
                                        <option value='PB'<%= ("PB".equals(estado)) ? ("selected='PB'") : ""%>>PB</option>
                                        <option value='PE'<%= ("PE".equals(estado)) ? ("selected='PE'") : ""%>>PE</option>
                                        <option value='PI'<%= ("PI".equals(estado)) ? ("selected='PI'") : ""%>>PI</option>
                                        <option value='PR'<%= ("PR".equals(estado)) ? ("selected='PR'") : ""%>>PR</option>
                                        <option value='RJ'<%= ("RJ".equals(estado)) ? ("selected='RJ'") : ""%>>RJ</option>
                                        <option value='RN'<%= ("RN".equals(estado)) ? ("selected='RN'") : ""%>>RN</option>
                                        <option value='RO'<%= ("RO".equals(estado)) ? ("selected='RO'") : ""%>>RO</option>
                                        <option value='RR'<%= ("RR".equals(estado)) ? ("selected='RR'") : ""%>>RR</option>
                                        <option value='RS'<%= ("RS".equals(estado)) ? ("selected='RS'") : ""%>>RS</option>
                                        <option value='SC'<%= ("SC".equals(estado)) ? ("selected='SC'") : ""%>>SC</option>
                                        <option value='SE'<%= ("SE".equals(estado)) ? ("selected='SE'") : ""%>>SE</option>
                                        <option value='SP'<%= ("SP".equals(estado)) ? ("selected='SP'") : ""%>>SP</option>
                                        <option value='TO'<%= ("TO".equals(estado)) ? ("selected='TO'") : ""%>>TO</option>


                                    </select>
                                </td>
                            </tr>



                            <tr>
                                <td> CEP: </td>
                                <td><input type="text" name="CEP" value="<%=cep%>" required="true" size="10" /></td>
                            </tr>

                            <tr>
                                <td> Endereço Próprio: </td>
                                <td><input type="text" name="Endereco1" value="<%=endereco1%>"  required="true" size="40" /></td>
                            </tr>
                            <tr>
                                <td> Número: </td>
                                <td><input type="text" name="Numero1" value="<%=numero1%>"  required="true" size="15" /></td>
                            </tr>
                            <tr>
                                <td> Complemento: </td>
                                <td><input type="text" name="Complemento1" value="<%=complemento1%>"  size="40" /></td>
                            </tr
                            
                            <tr>
                                <td> Endereço de um amigo(em caso de presente): </td>
                               
                            </tr>
                            <tr>
                                <td> CEP: </td>
                                <td><input type="text" name="CEP2" value="<%=cep2%>" required="true" size="10" /></td>
                            </tr>

                            <tr>
                                <td> Endereço do amigo: </td>
                                <td><input type="text" name="Endereco2" value="<%=endereco2%>" required="true" size="40" /></td>
                            </tr>
                            <tr>
                                <td> Número: </td>
                                <td><input type="text" name="Numero2" value="<%=numero2%>" required="true" size="15" /></td>
                            </tr>
                            <tr>
                                <td> Complemento: </td>
                                <td><input type="text" name="Complemento2"  value="<%=complemento2%>" size="40" /></td>
                            </tr> 


                            <tr><td><br></td></tr>
                            <tr><td><br></td></tr>

                            <tr>
                                <td><input type="submit" value="  Atualizar  " onclick="if(validarSenha()) return true; else return false;"/> </td> 

                                </form>


                            <form action="Home.jsp" method="post">
                                <td> <input type="submit" name="  Voltar  " value="Voltar" size="50" /> </td>
                            </form>
                            </tr>

                        </table>


                    </div>
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

                    </html>



                    </body>
                    </html>