package sv.edu.udb.www.springbootmvcs.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import sv.edu.udb.www.springbootmvcs.entities.EstudiantesEntity;
import sv.edu.udb.www.springbootmvcs.services.EstudianteRepository;

import java.util.List;

@Component
public class EstudianteDAOImpl implements EstudianteDAO {

    @Autowired
    private EstudianteRepository estudianteRepository;

    @Override
    public List<EstudiantesEntity> obtenerTodosEstudiantes() {
        return estudianteRepository.findAll();
    }

    @Override
    public EstudiantesEntity obtenerEstudiantePorCarnet(String carnet) {
        return estudianteRepository.findById(carnet).orElse(null);
    }

    @Override
    public EstudiantesEntity guardarEstudiante(EstudiantesEntity estudiante) {
        return estudianteRepository.save(estudiante);
    }

    @Override
    public EstudiantesEntity actualizarEstudiante(EstudiantesEntity estudiante) {
        return estudianteRepository.save(estudiante);
    }

    @Override
    public void eliminarEstudiantePorCarnet(String carnet) {
        estudianteRepository.deleteById(carnet);
    }
}
