package com.onsafety.backendPessoa.DTO;




import com.onsafety.backendPessoa.Model.Pessoa;

import java.time.LocalDate;
/**
 * Data Transfer Object para operações com a entidade Pessoa.
 */
public record PessoaDTO(
         Long id,
         String nome,
         String cpf,
         LocalDate dataNascimento,
         String email) {


    public PessoaDTO(Pessoa pessoa) {

        this(pessoa.getId(), pessoa.getNome(), pessoa.getCpf(), pessoa.getDataNascimento(), pessoa.getEmail());

    }
}
