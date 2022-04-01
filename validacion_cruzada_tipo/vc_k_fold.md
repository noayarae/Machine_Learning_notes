# Validación Cruzada de k-fold
La validación cruzada es un procedimiento de re-muestreo de la BD que se usa para evaluar modelos de ML. La vc sigue los siguientes pasos:
- Mezclar aleatoriamente la BD.
- Dividir la BD en k grupos.
- Un grupos de datos se toma o reserva para evaluar o testear el modelo ML.
- El resto de los grupos (k-1) se emplean para entrenar el modelo ML.
- Ajustar el modelo con el set de grupos de entrenamiento.
- Conservar la puntuacion del modelo (score de error) y descartar el modelo.
- Repetir el mismo proceso tomando el segundo grupo para evaluación y el resto para entrenamiento.
- Cada observación de la BD es asignado a un grupo individual y permanece en este grupo durante el proceso. Esto implica que a cada 
observación se da la una oportunidad de participar en el entrenamiento del modelo y (k-1) veces en la evaluacion del modelo
- La bondad del modelo es igual al promedio de los k scores o a un muestreo de ellos.

### Selección del valor de k
El valor de k debe elegirse con criterio. Un valor no adecuado de k puede resultar en una idea errónea de la bondad del modelo, como una puntuación con una varianza alta (que puede cambiar mucho según los datos utilizados para ajustar el modelo) o un sesgo alto , (como una sobreestimación de la habilidad del modelo). A continuación se dan algunas recomendaciones para establecer el valor de k:

- En principio el valor de k debe ser representativo de tal forma que cada grupo de entrenamiento y evaluacion debe ser suficientemente representativo a la BD.
- Valores de k entre 5 y 10 son usualmente recomendados, sin embargo no existe una regla formal.
- En BD con largos registros, el valor de **k=10** ha resultado en modelos con low bias y varianzas moderadas.
- Cuando la BD es muy pequeña, se recomienda establecer k=n (n: longitud de registro). En este caso 1 registro se toma para evaluar el modelo y (k-1) registros para entrenar. Este enfoque es también llamado CV dejando uno fuera **(leave-one-out cross-validation)**
- As k gets larger, the difference in size between the training set and the resampling subsets gets smaller. As this difference decreases, the bias of the technique becomes smaller (Ver más).



```python
from xgboost import XGBRegressor
import xgboost as xgb
```

```python
0.98415
```


