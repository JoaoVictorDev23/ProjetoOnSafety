package com.onsafety.backendPessoa.Repository;

import com.onsafety.backendPessoa.Model.Pessoa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
/**
 * Repository para persistencia de dados com JPA para entidade pessoa.
 */
@Repository
public interface PessoaRepository extends JpaRepository<Pessoa, Long> {

    Pessoa findByCpf(String cpf);
}