package my.com.entity;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
@Entity(name = "TypeMovie")
public class TypeMovie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IDTypeMovie", columnDefinition = "int")
    private int id;
    @Column(name = "TypeMovieName", columnDefinition = "nvarchar(100)")
    private String name;
    @ManyToMany(fetch = FetchType.EAGER, mappedBy = "movieTypes")
    private Set<Movie> movies;
    public TypeMovie() {
        // TODO Auto-generated constructor stub
    }
    
    public TypeMovie(int id) {
		super();
		this.id = id;
	}

	public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public TypeMovie(int id, String name) {
        super();
        this.id = id;
        this.name = name;
    }
	@Override
	public String toString() {
		return "TypeMovie [id=" + id + ", name=" + name +  "]";
	}
    
}