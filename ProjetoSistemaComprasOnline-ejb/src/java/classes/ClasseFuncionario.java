 /*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import conexao.FuncionarioFacade;
import entidade.Funcionario;
import javax.ejb.EJB;
import javax.ejb.Remote;
import javax.ejb.Stateless;
@Remote
@Stateless(mappedName = "ejb/ClasseFuncionario")
public class ClasseFuncionario  implements InterfaceFuncionarioRemote{
    
    @EJB
    FuncionarioFacade facade;

    @Override
    public void incluir(Funcionario pessoa) {
        facade.create(pessoa);
    }

    @Override
    public void alterar(Funcionario pessoa) {
        facade.edit(pessoa);
    }

    @Override
    public void excluir(Funcionario pessoa) {
        facade.remove(pessoa);
    }

    @Override
    public Funcionario consultar(Funcionario pessoa) {
        return facade.consultar(pessoa.getCpf());
    }

    @Override
    public Funcionario consultarLogin(Funcionario pessoa) {
        return facade.consultarLogin(pessoa.getCpf(), pessoa.getSenha());
    }

    
}
