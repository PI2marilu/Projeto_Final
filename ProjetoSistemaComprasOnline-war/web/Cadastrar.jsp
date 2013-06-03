

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ProjetoSistemaComprasOnline</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" href="css/images/favicon.ico" />
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />

    </head>
    <script type="text/javascript">
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
                           <li><a title="Home" href="index.jsp">Home<span></span></a></li>
                            <li><a title="Catalog" href="ConsultaCatalog">Catalog<span></span></a></li>
                            </ul>
                        </div>
                        <!-- END Navigation -->
                        <div class="cl"></div>
                        <div id="cart">
                            <p><a title="Meu Carrinho" href="#">Meu Carrinho:&nbsp; <%=itensTotal%> items</a></p>
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



                <form action="CadastrarUsuario" name="f1" align="center" method="post">

                    <h1>Formulário de Cadastro</h1>


                    <div id="table">
                        <table>

                            <tr><td><br></td></tr>

                            <tr>
                                <td> Nome Completo: </td>
                                <td><input type="text" name="Nome" required="true" size="40" /></td>
                            </tr>
                            <tr>
                                <td> CPF: </td>
                                <td><input type="text" name="CPF" required="true" size="40" /></td>
                            </tr>
                            <tr>
                                <td> Sexo: </td>
                                <td>
                                    <select name="Sexo" align="left" required="true">
                                        <option/>
                                        <option value="Masculino">Masculino</option>
                                        <option value="Feminino">Feminino</option>
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td>Como gostaria de ser chamado?</td>
                                <td>
                                    <input type="text" name="Apelido" required="true" size="40" />
                                </td>
                            </tr>
                            <tr>
                                <td> Email: </td>
                                <td><input type="text" name="Email" required="true" size="40" onblur="validarEmail();"/></td>
                            </tr>


                            <tr>
                                <td>
                                    Senha:
                                </td>
                                <td>
                                    <input type="password" name="Senha" required="true" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Confirmar senha:
                                </td>
                                <td>
                                    <input type="password" name="ConfirmaSenha" required="true" />
                                </td>
                            </tr>

                            <tr>
                                <td> Cidade: </td>
                                <td><input type="text" name="Cidade" required="true" size="40" /></td>
                            </tr>


                            <tr>
                                <td> Estado: </td>
                                <td>
                                    <select name="Estado" required="true" >
                                        <option/>
                                        <option value="AC">AC</option>
                                        <option value="AL">AL</option>
                                        <option value="AM">AM</option>
                                        <option value="AP">AP</option>
                                        <option value="BA">BA</option>
                                        <option value="CE">CE</option>
                                        <option value="DF">DF</option>
                                        <option value="ES">ES</option>
                                        <option value="GO">GO</option>
                                        <option value="MA">MA</option>
                                        <option value="MG">MG</option>
                                        <option value="MS">MS</option>
                                        <option value="MT">MT</option>
                                        <option value="PA">PA</option>
                                        <option value="PB">PB</option>
                                        <option value="PE">PE</option>
                                        <option value="PI">PI</option>
                                        <option value="PR">PR</option>
                                        <option value="RJ">RJ</option>
                                        <option value="RN">RN</option>
                                        <option value="RO">RO</option>
                                        <option value="RR">RR</option>
                                        <option value="RS">RS</option>
                                        <option value="SC">SC</option>
                                        <option value="SE">SE</option>
                                        <option value="SP">SP</option>
                                        <option value="TO">TO</option>

                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td> CEP: </td>
                                <td><input type="text" name="CEP" required="true" size="10" /></td>
                            </tr>

                            <tr>
                                <td> Endereço Próprio: </td>
                                <td><input type="text" name="Endereco1" required="true" size="40" /></td>
                            </tr>
                            <tr>
                                <td> Número: </td>
                                <td><input type="text" name="Numero1" required="true" size="15" /></td>
                            </tr>
                            <tr>
                                <td> Complemento: </td>
                                <td><input type="text" name="Complemento1"  size="40" /></td>
                            </tr>
                            <tr>
                                <td> Endereço de um amigo(em caso de presente): </td>

                            </tr>
                            <tr>
                                <td> CEP: </td>
                                <td><input type="text" name="CEP2" required="true" size="10" /></td>
                            </tr>

                            <tr>
                                <td> Endereço do amigo: </td>
                                <td><input type="text" name="Endereco2" required="true" size="40" /></td>
                            </tr>
                            <tr>
                                <td> Número: </td>
                                <td><input type="text" name="Numero2" required="true" size="15" /></td>
                            </tr>
                            <tr>
                                <td> Complemento: </td>
                                <td><input type="text" name="Complemento2"  size="40" /></td>
                            </tr>


                            <tr><td><br></td></tr>
                            <tr><td><br></td></tr>


                            <tr>
                                <td><input type="submit" value="  Cadastrar  " onclick="if(validarSenha()) return true; else return false;"/> </td> 

                                </form>


                            <form action="index.jsp" method="post">
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
