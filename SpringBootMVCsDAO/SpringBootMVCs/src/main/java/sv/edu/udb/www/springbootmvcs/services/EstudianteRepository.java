package sv.edu.udb.www.springbootmvcs.services;

import org.springframework.data.jpa.repository.JpaRepository;
import sv.edu.udb.www.springbootmvcs.entities.EstudiantesEntity;

public interface EstudianteRepository extends JpaRepository<EstudiantesEntity,String> {
    // Interfaz que gracias a su extends con JPARepository nos permite ejecutar las funciones basicas de JPA para trabajar con la bdd
    // Sin necesidad de definir dichas funciones
    // Es obligatorio que esta clase sea una INTERFAZ
}
