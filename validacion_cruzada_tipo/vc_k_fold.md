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

'''
from xgboost import XGBRegressor
import xgboost as xgb
'''


