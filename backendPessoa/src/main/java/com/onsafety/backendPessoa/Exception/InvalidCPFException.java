package com.onsafety.backendPessoa.Exception;
/**
 * Exceção personalizada para CPF inválido.
 */
public class InvalidCPFException extends RuntimeException {
    public InvalidCPFException(String message) {
        super(message);
    }
}