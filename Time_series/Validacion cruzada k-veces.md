## Validacion cruzada k-fold en Series de Tiempo
Los metodos potentes y rapidos que usan los algoritmos de ML son usualmente la particion de la base de dataos en dos: entrenamiento (train) y evaluacion (test). Sin embargo, estos metodos no puedes ser aplicados en series de tiempo, debido que estos criterios ignoran la secuencia temporal, el cual es la caracteristica mas importante de las series de tiempo.

En series de tiempo los modelos de ML emplean tecnicas de evaluacion llamados backtesting or hindcasting

### Por que los metodos clasicos de evaluacion de un modelo ML no son aplicables en Series de Tiempo?
Los metodos clasicos de evaluacion de un modelo de ML asume que las observaciones son independientes del tiempo. Esta consideracion no es cierta en series de tiempo.
En series de tiempo no se pueden aleatoriamente separar las observaciones en observaciones de entrenamiento y evaluacion, sino debemos considerar separaciones de observaciones manteniendo la secuencia de las observaciones.

En el pronóstico de series de tiempo, esta evaluación de modelos sobre datos históricos se denomina backtesting. En algunos dominios de series de tiempo, como la meteorología, esto se denomina predicción retrospectiva, en lugar de predicción.

A continuacion se describen tres metodos de backtest de evaluacion de series de tiempo en ML: Separacion Train-Test, multiple separacion Train-Test, y validacion progresiva.
#### Separacion Train-Test (Train-Test split)
Esta saparacion de serie de tiempo consiste en establecer un punto de particion de la serie para obtener dos series, la primera serie de entrenamiento (train) antes del punto de particion y la segunda serie de evaluacion (test) despues del punto. Segun la cantidad de observaciones (logitud de la serie) la separacion puede ser de 50-50, 60-40, 70-30 y otro.
#### Multiple separacion Train-Test (Multiple Train-Test splits)
Consiste en repetir el proceso de separacion de la serie varias veces. La multiple separacion de la serie en Train-test, permitira tener vario pares train-test por tanto hacer el modelo de ML mas robusto.
Esta múltiple separación puede hacerse manualmente, repitiendo la separación de la serie en varios puntos; sin embargo, la librería scikit-learn provee una función para esto.
___Continua___
***Continua***

#### Validación progresiva (Walk-forward)
Se debe establecer dos parametros:
- El mínimo número de observaciones. Determina el mínimo número de oservaciones en el modelo de entrenamiento (nmin).
- La ventana de desplazamiento o expansión. Determina si el modelo será entrenado en los datos disponibles o solo en las obsevaciones más recientes.

Estos parametros se procesasn como sigue:
- Empezando del inicio de la serie, se toma mínimo número de observaciones (ventana de entrenamiento) para entrenar el primer modelo de ML (v1, v2,...,v_nmin).
- El modelo hace la predicción del siguiente valor de la serie (es decir del valor v_nmin+1)
- La prediccion es comparada con el valor conocido.
- La ventana se amplia en una unidad y luego se repite el proceso

De este modo, este método considera la ampliacion de la serie de entrenamiento en una unidad de tiempo en cada repetición. Este método toma el nombre de Walk-forward, walk-forward validation o Rolling-window Analysis o Rolling forecast.

Este método genera más modelos de entrenamiento con la desventaja de incrementar el costo computacional. Este método contribuye a un modelo ML mucho més robusto. Se debe prestar atención al ancho de la ventana y al tipo de ventana, estos podrían ajustarse para idear un ancho de prueba de tal forma sea significativamente menos costoso desde el punto de vista computacional.

La validación progresiva de las Series de Tiempo (ST) es el equivalente a la validación cruzada en los modelos estándares de ML. Su uso en ST es muy recomendado.

See here:
https://machinelearningmastery.com/backtest-machine-learning-models-time-series-forecasting/









