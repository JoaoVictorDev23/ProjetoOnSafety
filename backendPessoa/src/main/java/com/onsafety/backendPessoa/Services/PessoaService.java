package com.onsafety.backendPessoa.Services;


import com.onsafety.backendPessoa.DTO.PessoaDTO;

import java.util.List;
/**
 * Interface dos services.
 */
public interface PessoaService {
    PessoaDTO createPessoa(PessoaDTO pessoaDTO);
    PessoaDTO getPessoaById(Long id);
    List<PessoaDTO> getAllPessoas();
    PessoaDTO updatePessoa(Long id, PessoaDTO pessoaDTO);
    void deletePessoa(Long id);
}