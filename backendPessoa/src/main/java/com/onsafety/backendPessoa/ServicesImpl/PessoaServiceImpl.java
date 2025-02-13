package com.onsafety.backendPessoa.ServicesImpl;


import com.onsafety.backendPessoa.DTO.PessoaDTO;
import com.onsafety.backendPessoa.Exception.AlreadyExistsException;
import com.onsafety.backendPessoa.Exception.InvalidCPFException;
import com.onsafety.backendPessoa.Model.Pessoa;
import com.onsafety.backendPessoa.Repository.PessoaRepository;
import com.onsafety.backendPessoa.Services.PessoaService;
import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * Implementação do serviço para operações com a entidade Pessoa.
 */
@Service
public class PessoaServiceImpl implements PessoaService {

    private final PessoaRepository pessoaRepository;

    @Autowired
    public PessoaServiceImpl(PessoaRepository pessoaRepository) {
        this.pessoaRepository = pessoaRepository;
    }

    @Override
    @Transactional
    public PessoaDTO createPessoa(PessoaDTO pessoaDTO) {
        Pessoa pessoaExisting = pessoaRepository.findByCpf(pessoaDTO.cpf());
        if (pessoaExisting != null) {
            throw new AlreadyExistsException("Pessoa com o CPF " + pessoaDTO.cpf() + " já existe.");
        }

        Pessoa pessoa = new Pessoa(pessoaDTO);
        Pessoa savedPessoa = pessoaRepository.save(pessoa);
        return new PessoaDTO(savedPessoa);
    }

    @Override
    public PessoaDTO getPessoaById(Long id) {
        Optional<Pessoa> pessoa = pessoaRepository.findById(id);
        return pessoa.map(PessoaDTO::new)
                .orElseThrow(() -> new EntityNotFoundException("Pessoa com o ID " + id + " não encontrado."));
    }

    @Override
    public List<PessoaDTO> getAllPessoas() {
        List<Pessoa> pessoas = pessoaRepository.findAll();
        return pessoas.stream().map(PessoaDTO::new).collect(Collectors.toList());
    }

    @Override
    @Transactional

    public PessoaDTO updatePessoa(Long id, PessoaDTO pessoaDTO) {

        try{
            Pessoa existingPessoa = pessoaRepository.findById(id)
                    .orElseThrow(() -> new EntityNotFoundException("Pessoa com o ID " + id + " não encontrado."));


            Pessoa pessoaCpf = pessoaRepository.findByCpf(pessoaDTO.cpf());
            if (pessoaCpf != null && !pessoaCpf.getId().equals(id)) {
                throw new AlreadyExistsException("Já existe uma pessoa com o CPF " + pessoaDTO.cpf() + ".");
            }


            existingPessoa.setNome(pessoaDTO.nome());
            existingPessoa.setCpf(pessoaDTO.cpf());
            existingPessoa.setDataNascimento(pessoaDTO.dataNascimento());
            existingPessoa.setEmail(pessoaDTO.email());

            Pessoa updatedPessoa = pessoaRepository.save(existingPessoa);
            return new PessoaDTO(updatedPessoa);

        }catch(InvalidCPFException e){
            throw new InvalidCPFException("CPF invalido.");

        }

    }

    @Override
    @Transactional

    public void deletePessoa(Long id) {
        if (!pessoaRepository.existsById(id)) {
            throw new EntityNotFoundException("Pessoa com o ID " + id + " não encontrado.");
        }
        pessoaRepository.deleteById(id);
    }

}