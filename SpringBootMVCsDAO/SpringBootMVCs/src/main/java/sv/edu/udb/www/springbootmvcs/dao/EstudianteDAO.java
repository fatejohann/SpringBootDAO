package sv.edu.udb.www.springbootmvcs.dao;



import sv.edu.udb.www.springbootmvcs.entities.EstudiantesEntity;

import java.util.List;

public interface EstudianteDAO {

    List<EstudiantesEntity> obtenerTodosEstudiantes();

    EstudiantesEntity obtenerEstudiantePorCarnet(String carnet);

    EstudiantesEntity guardarEstudiante(EstudiantesEntity estudiante);

    EstudiantesEntity actualizarEstudiante(EstudiantesEntity estudiante);

    void eliminarEstudiantePorCarnet(String carnet);
}
