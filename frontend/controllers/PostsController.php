<?php
namespace frontend\controllers;

use Yii;
use app\models\Posts;
use app\models\PostsSearch;
use app\models\Autors;
use app\models\AutorsSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\Pagination;
use yii\data\Sort;

/**
 * PostsController implements the CRUD actions for Posts model.
 */
class PostsController extends Controller
{
    public function actionPostsAutor($autorId)
    {
        $query = Posts::find();

        $posts = $query->orderBy('id')
            ->where(['autor' => $autorId])
            ->all();

        $query_2 = Autors::find();

        $autors = $query_2->orderBy('id')
            ->all();

        return $this->render('posts-autor', [
            'posts' => $posts,
            'autors' => $autors,
        ]);
    }

    public function actionPosts()
    {
        $sort = new Sort([
        'attributes' => [
        'date' => [
            'asc' => ['date' => SORT_ASC],
            'desc' => ['date' => SORT_DESC],
            'default' => SORT_DESC,
            'label' => 'date',
        ],
        ],
        'defaultOrder' => ['date'=>SORT_DESC],
        ]);

        $query = Posts::find();

        $pagination = new Pagination([
            'defaultPageSize' => 5,
            'totalCount' => $query->count(),
        ]);

        $posts = $query->orderBy($sort->orders)
            ->offset($pagination->offset)
            ->limit($pagination->limit)
            ->all();

        $query_2 = Autors::find();

        $autors = $query_2->orderBy('id')
            ->all();

        return $this->render('posts', [
            'posts' => $posts,
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
     * Finds the Posts model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Posts the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Posts::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
