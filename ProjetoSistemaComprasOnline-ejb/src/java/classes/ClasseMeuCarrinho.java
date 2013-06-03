
package classes;

import conexao.MeuCarrinhoFacade;
import entidade.MeuCarrinho;
import entidade.Usuario;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;



@Stateless(mappedName = "ejb/ClasseMeuCarrinho")
public class ClasseMeuCarrinho implements InterfaceMeuCarrinhoLocal {
    
    @EJB
    MeuCarrinhoFacade facade;

    @Override
    public void incluir(MeuCarrinho produto) {
         facade.create(produto);
    }

    @Override
    public void alterar(MeuCarrinho produto) {
         facade.edit(produto);
    }

    @Override
    public void excluir(MeuCarrinho produto) {
         facade.remove(produto);
    }

    @Override
    public List<MeuCarrinho> consultar(Usuario pessoa) {
        return facade.consultarMeuCarrinho(pessoa);
    }
    
}
