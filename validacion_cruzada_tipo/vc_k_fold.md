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
- El valord k no puede establecerse en 1, porque esto implicaría tomar toda la BD tanto para entrenar y evaluar el modelo.
- As k gets larger, the difference in size between the training set and the resampling subsets gets smaller. As this difference decreases, the bias of the technique becomes smaller (Ver más).

Variantes de la validación cruzada
- **Train/Test Split**. Esto es cuando la BD es dividido en solo 2 grupos. Esto se debe dar en casos muy extremos. 
- **Leave-one-out cross-validation**. (k = n) Esto se establece en caso que la BD sea muy pequeña.
- **Stratified**. Estratificado. Generalmente en modelos de clasificación. Esto garantiza la misma proporcion de registros con las categorias de la BD tanto en el grupo de entrenamiento como evaluación. Por ejm: Si se tiene 100 observaciones de los cuales 30% corresponden a la categoría "Yes" y 70% a "No", al establcer la CV con k=5, la muestra de entrenamiento tendrá 80 observacion aleatoriamente seleccionadas con 56 "Yes" y 24 "No" y la muestra de evaluación tendrá 20 observaciones con 14 "Yes" y 6 "No"
- **Repeated**. El procedimiento de validación cruzada de k veces se repite n veces. La BD se baraja antes de cada repetición, lo que da como resultado una división diferente de la muestra/proceso.
- **Anidado (Nested)**. Aquí, una segunda validación cruzada de k-veces se ejecuta dentro de cada grupo de la primera validación cruzada tambien de k-veces. Esto generalmente se realiza en la calibración/ajuste/evaluación de hiperparámetros del modelo. Esto tambien es llamado validación cruzada doble.  



```python
from xgboost import XGBRegressor
import xgboost as xgb
```

```python
0.98415
```


