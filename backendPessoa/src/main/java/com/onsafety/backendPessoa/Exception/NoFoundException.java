package com.onsafety.backendPessoa.Exception;
/**
 * Exceção personalizada para Não existente.
 */
public class NoFoundException extends RuntimeException {
    public NoFoundException(String message) {
        super(message);
    }
}