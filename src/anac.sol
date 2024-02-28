// SPDX-License-Identifier: MIT
//no geral pragmas são instruções para o compilador sobre como tratar o código fonte.
pragma solidity ^0.8.0; // Versão do compilador Solidity

contract Anac { // Define um contrato chamado Anac

    // Declara uma variável de estado chamada idade do tipo uint (inteiro sem sinal de 256 bits) que possui como valor inicial 18. 
    // Com a palavra-chave public outros contratos podem ter acesso à variável.
    uint public idade = 18;

    // Declara uma variável de estado owner do tipo endereço (address), que é publicamente acessível.
    address public owner;

    // Define o construtor do contrato, que é um bloco de código executado uma única vez quando o contrato é implantado na blockchain.
    constructor() {
        // Atribui o endereço de quem está implantando o contrato (o criador do contrato) à variável owner. 
        owner = msg.sender; // msg é uma variável global que contém algumas propriedades que permitem acessar o blockchain.
    }

    // Declara uma função setIdade que recebe um argumento _idade do tipo uint. 
    function setIdade(uint _idade) public {

        // O require verifica se a condição especificada (se o endereço que está chamando a função é o mesmo que o endereço armazenado na variável owner) é verdadeira.
        require(msg.sender == owner, "Somente o dono do contrato pode alterar a idade."); 
        idade = _idade;
    }

    // Declara uma função getIdade que não recebe argumentos
    // é marcada como view, porque não modifica o estado do contrato.
    function getIdade() public view returns (uint) {
        return idade; // Retorna o valor atual da variável idade.
    }
}