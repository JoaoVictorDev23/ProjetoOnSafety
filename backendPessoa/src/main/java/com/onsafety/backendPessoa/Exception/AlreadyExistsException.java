package com.onsafety.backendPessoa.Exception;

/**
 * Exceção personalizada para Já existente.
 */
public class AlreadyExistsException extends RuntimeException {
    public AlreadyExistsException(String message) {
        super(message);
    }
}
