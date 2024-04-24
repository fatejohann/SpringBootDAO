package sv.edu.udb.www.springbootmvcs.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

import java.math.BigDecimal;
import java.util.Objects;

@Entity
@Table(name = "estudiantes", schema = "registro_estudiantes")
public class EstudiantesEntity {

    @Id
    @Column(name = "carnet", nullable = false, length = 8)
    @NotEmpty(message = "El carnet es obligatorio!")
    private String carnet;
    @Basic
    @Column(name = "nombres", nullable = false, length = 40)
    @NotEmpty(message = "El nombre es obligatorio!")
    private String nombres;
    @Basic
    @Column(name = "apellidos", nullable = false, length = 40)
    @NotEmpty(message = "El apellido es obligatorio!")
    private String apellidos;
    @Basic
    @Column(name = "edad", nullable = false)
    @Range(min=0, message = "No se aceptan edades menores a 0!")
    private int edad;
    @Basic
    @Column(name = "cum", nullable = false, precision = 2)
    @Range(min=0, max = 10, message = "CUM fuera del rango permitido (0 - 10)!")
    private BigDecimal cum;
    @Basic
    @Column(name = "genero", nullable = false, length = 1)
    private String genero;
    @Basic
    @Column(name = "carrera", nullable = false, length = 40)
    @NotEmpty(message = "La carrera es obligatoria!")
    private String carrera;

    public String getCarnet() {
        return carnet;
    }

    public void setCarnet(String carnet) {
        this.carnet = carnet;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public BigDecimal getCum() {
        return cum;
    }

    public void setCum(BigDecimal cum) {
        this.cum = cum;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        EstudiantesEntity that = (EstudiantesEntity) o;
        return edad == that.edad && Objects.equals(carnet, that.carnet) && Objects.equals(nombres, that.nombres) && Objects.equals(apellidos, that.apellidos) && Objects.equals(cum, that.cum) && Objects.equals(genero, that.genero) && Objects.equals(carrera, that.carrera);
    }

    @Override
    public int hashCode() {
        return Objects.hash(carnet, nombres, apellidos, edad, cum, genero, carrera);
    }
}
