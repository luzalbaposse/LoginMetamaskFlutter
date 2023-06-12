// Smart contract para almacenar la información de un perfil en un NFT.
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ToDoListNFT is ERC721 { // 
    struct Perfil { // Creo una estructura para almacenar la información del perfil
        string nombre;
        string purpose;
    }

    mapping(uint256 => Perfil) private perfiles; // Creo un mapping para almacenar los perfiles
    uint256 private tokenIdCounter; // Creo un contador para los tokens

    constructor() ERC721("ToDoListNFT", "TODO") {} // Creo el contrato con el nombre y el símbolo

    function createProfile(string memory _nombre, string memory _purpose) public { // Creo una función para crear un perfil 
        uint256 newTokenId = tokenIdCounter; // Asigno el valor del contador al nuevo token
        tokenIdCounter++; // Incremento el contador
 
        Perfil memory newProfile = Perfil(_nombre, _purpose); // Creo un nuevo perfil con la información que recibí
        perfiles[newTokenId] = newProfile; // Almaceno el perfil en el mapping

        _safeMint(msg.sender, newTokenId); // Asigno el token al usuario que lo creó
    }

    function getProfile(uint256 _tokenId) public view returns (string memory, string memory) { // Creo una función para obtener la información de un perfil
        require(_exists(_tokenId), "El token no existe :("); // Verifico que el token exista
        return (perfiles[_tokenId].nombre, perfiles[_tokenId].purpose); // Devuelvo la información del perfil
    }
}

