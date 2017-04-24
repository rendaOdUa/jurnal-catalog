<?php

namespace frontend\controllers;

use Yii;
use app\models\Autors;
use app\models\AutorsSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\Pagination;
use yii\data\Sort;

/**
 * AutorsController implements the CRUD actions for Autors model.
 */
class AutorsController extends Controller
{
    public function actionAutors()
    {
        $sort = new Sort([
        'attributes' => [
        'name' => [
            'asc' => ['name' => SORT_ASC],
            'desc' => ['name' => SORT_DESC],
            'default' => SORT_DESC,
            'label' => 'name',
        ],
        'surname' => [
            'asc' => ['surname' => SORT_ASC],
            'desc' => ['surname' => SORT_DESC],
            'default' => SORT_DESC,
            'label' => 'surname',
        ],
        ],
        'defaultOrder' => ['name'=>SORT_DESC],
        ]);

        $query = Autors::find();

        $pagination = new Pagination([
            'defaultPageSize' => 10,
            'totalCount' => $query->count(),
        ]);

        $autors = $query->orderBy($sort->orders)
            ->offset($pagination->offset)
            ->limit($pagination->limit)
            ->all();

        return $this->render('autors', [
            'autors' => $autors,
            'pagination' => $pagination,
            'sort' => $sort,
        ]);
    }
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }


    /**
     * Finds the Autors model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Autors the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Autors::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
