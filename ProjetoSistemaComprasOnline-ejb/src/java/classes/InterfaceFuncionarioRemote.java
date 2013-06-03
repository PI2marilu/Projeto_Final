/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import entidade.Funcionario;
import javax.ejb.Remote;
@Remote
public interface InterfaceFuncionarioRemote {
    public void incluir(Funcionario pessoa);
    public void alterar(Funcionario pessoa);
    public void excluir(Funcionario pessoa);
    public Funcionario consultar(Funcionario pessoa);
    public Funcionario consultarLogin(Funcionario pessoa);
    
}
