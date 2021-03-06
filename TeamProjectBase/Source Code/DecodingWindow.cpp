//*************************************************************************************************************
//
// 解読書のマネージャー[処理 [DecodingManager.h]
// Author:IKUTO SEKINE
//
//*************************************************************************************************************
//-------------------------------------------------------------------------------------------------------------
// インクルードファイル
//-------------------------------------------------------------------------------------------------------------
#include "DecodingWindow.h"
#include "DecodingUI.h"
#include "myhash.h"
#include "texture.h"
#include "mouse.h"
#include "manager.h"

//-------------------------------------------------------------------------------------------------------------
// マクロ定義
//-------------------------------------------------------------------------------------------------------------
#define DECODINGWINDOW_FILENAME "data/TEXT/InitWindowInfo.txt"

//-------------------------------------------------------------------------------------------------------------
// 静的メンバ変数の初期化
//-------------------------------------------------------------------------------------------------------------
LPDIRECT3DTEXTURE9 CDecodingWindow::m_pTexture[TEX_MAX]      = Mlf_array(nullptr);				// テクスチャ情報
LPDIRECT3DTEXTURE9 CDecodingWindow::m_pDocTexture[TEX_W_MAX] = Mlf_array(nullptr);				// ドキュメントのテクスチャ情報
CHash *            CDecodingWindow::m_pHash	                 = nullptr;							// ハッシュポインタ
SETINGINFO         CDecodingWindow::m_InitSeting[TYPE_MAX];										// 初期化設定
int                CDecodingWindow::m_nFrameMax              = MYLIB_INT_UNSET;					// 最大フレーム
float              CDecodingWindow::m_fSclaMax               = 1.0f;							// スケールの最大
D3DXCOLOR          CDecodingWindow::m_aChgCol[CHGCOL_MAX]    = Mlf_array(MYLIB_D3DXCOR_SET);	// 変更色
float              CDecodingWindow::m_fWheelForth            = MYLIB_FLOAT_UNSET;				// マウスホイールの動かす力

//-------------------------------------------------------------------------------------------------------------
// コンストラクタ
//-------------------------------------------------------------------------------------------------------------
CDecodingWindow::CDecodingWindow()
{
}

//-------------------------------------------------------------------------------------------------------------
// デストラクタ
//-------------------------------------------------------------------------------------------------------------
CDecodingWindow::~CDecodingWindow()
{
}

//-------------------------------------------------------------------------------------------------------------
// ハッシュの作成
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::MakeHash(void)
{
	// キーデータ
	char * Key[TYPE_MAX] =
	{
		{ "Window"       },
		{ "Close"        },
		{ "ScrollBar"    },
		{ "ScrollHandle" },
	};

	// データ
	char * Data[TYPE_MAX] =
	{
		{ "0" },
		{ "1" },
		{ "2" },
		{ "3" },
	};

	// ハッシュの作成
	m_pHash = CHash::Create();

	// ハッシュに挿入する
	for (int nCntHash = 0; nCntHash < TYPE_MAX; nCntHash++)
	{
		m_pHash->Insert(Key[nCntHash], Data[nCntHash]);
	}
}

//-------------------------------------------------------------------------------------------------------------
// ハッシュの開放
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::ReleaseHash(void)
{
	// nullチェック
	if (m_pHash != nullptr)
	{// ハッシュテーブルの開放
		m_pHash->ReleaseHashtable();
		// ハッシュの破棄
		delete m_pHash;
		m_pHash = nullptr;
	}
}

//-------------------------------------------------------------------------------------------------------------
// 読み込み
//-------------------------------------------------------------------------------------------------------------
HRESULT CDecodingWindow::Load(void)
{
	// テクスチャ情報を取得する
	m_pDocTexture[TEX_W_TELLTHEPICTURE]    = CTexture::GetTexture(CTexture::TEX_UI_DECODING_D00);
	m_pDocTexture[TEX_W_SHAPEMEMORIZATION] = CTexture::GetTexture(CTexture::TEX_UI_DECODING_D01);
	m_pDocTexture[TEX_W_CORDCUTTING]       = CTexture::GetTexture(CTexture::TEX_UI_DECODING_D02);
	m_pDocTexture[TEX_W_MAZE]              = CTexture::GetTexture(CTexture::TEX_UI_DECODING_D03);
	m_pDocTexture[TEX_W_SIMON]             = CTexture::GetTexture(CTexture::TEX_UI_DECODING_D04);
	m_pDocTexture[TEX_W_NOWMAKING]         = CTexture::GetTexture(CTexture::TEX_UI_DECODING_D05);

	m_pTexture[TEX_CLOSEBUTTON]            = CTexture::GetTexture(CTexture::TEX_UI_DECODING_CLOSE);
	m_pTexture[TEX_SCROLLBAR]              = CTexture::GetTexture(CTexture::TEX_UI_DECODING_S_BAR);
	m_pTexture[TEX_SCROLLHANDLE]           = CTexture::GetTexture(CTexture::TEX_UI_DECODING_S_HANDLE);

	// 設定情報の初期化
	for (int nCntSet = 0; nCntSet < TYPE_MAX; nCntSet++)
	{
		m_InitSeting[nCntSet] = SETINGINFO();
	}

	// ファイル読み込み
	if (CLoadFile::ReadLineByLineFromFile(DECODINGWINDOW_FILENAME, ReadFromLine) != CLoadFile::LR_SUCCESS)
	{
#ifdef _DEBUG
		std::cout << "<<<<<<CDecodingManagerのファイル読み込みが失敗しました。>>>>>>\n";
#endif // _DEBUG
		return E_FAIL;
	}
	return S_OK;
}

//-------------------------------------------------------------------------------------------------------------
// 開放
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::UnLoad(void)
{
	for (int nCntUI = 0; nCntUI < TEX_MAX; nCntUI++)
	{
		m_pTexture[nCntUI] = nullptr;
	}
}

//-------------------------------------------------------------------------------------------------------------
// 生成
//-------------------------------------------------------------------------------------------------------------
std::shared_ptr<CDecodingWindow> CDecodingWindow::Create(WINDOW_SETING &Seting)
{
	// スマートポインタの生成
	std::shared_ptr<CDecodingWindow> pWindow = std::make_shared<CDecodingWindow>();

	// 初期化
	pWindow->Init(Seting);
	return pWindow;
}

//-------------------------------------------------------------------------------------------------------------
// 初期化
//-------------------------------------------------------------------------------------------------------------
HRESULT CDecodingWindow::Init(WINDOW_SETING &Seting)
{
	// 設定の初期化
	InitSeting(Seting);

	// UIの作成
	MakeUI();

	// ドキュメントのUV情報の初期化
	InitDocumentUVInfo(Seting);

	// UVの大きさの取得
	float *pSizeV = &m_pUi[TYPE_WINDOW]->GetTex()->size.v;

	// スクロールハンドルの大きさの設定を変更
	m_pUi[TYPE_SCROLLHANDLE]->SetSize(D3DXVECTOR2(m_pUi[TYPE_SCROLLHANDLE]->GetSize().x, m_Seting[TYPE_SCROLLBAR].size.y * *pSizeV));
	m_Seting[TYPE_SCROLLHANDLE].size.y = m_Seting[TYPE_SCROLLBAR].size.y * *pSizeV;

	// 可動域の計算
	m_ScrollRange.max   =  m_Seting[TYPE_SCROLLBAR].size.y * MYLIB_HALF_SIZE - (m_Seting[TYPE_SCROLLHANDLE].size.y * MYLIB_HALF_SIZE);
	m_ScrollRange.min   = -m_Seting[TYPE_SCROLLBAR].size.y * MYLIB_HALF_SIZE + (m_Seting[TYPE_SCROLLHANDLE].size.y * MYLIB_HALF_SIZE);
	m_fScrollRangeValue =  m_ScrollRange.GetDifference();

	// スクロールハンドルの位置の設定を変更
	m_Seting[TYPE_SCROLLHANDLE].pos.y = m_Seting[TYPE_SCROLLBAR].pos.y + m_ScrollRange.min - m_Seting[TYPE_SCROLLBAR].pos.y;

		// 親の設定
	SetPosAccordingParent();

	// 符号の設定
	SetSign(1);
	// 出現情報の初期化
	InitAppearInfo();

	m_nSelectIndex = TYPE_NONE;
	return S_OK;
}

//-------------------------------------------------------------------------------------------------------------
// 更新
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::Update()
{
}

//-------------------------------------------------------------------------------------------------------------
// 描画
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::Draw()
{
}

//-------------------------------------------------------------------------------------------------------------
// 出現情報の初期化
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::InitAppearInfo(void)
{
	// フレームを初期化
	m_nFrame = MYLIB_INT_UNSET;
	// スケール変化値を設定
	m_fScalValue = (m_fSclaMax / (m_nFrameMax + 1) * m_nSign);
	// 符号が0未満の時
	if (m_nSign > 0)
	{// スケールを設定を無し設定
		m_fScal = MYLIB_FLOAT_UNSET;
	}
	else
	{// スケールを最大に設定
		m_fScal = m_fSclaMax;
	}
}

//-------------------------------------------------------------------------------------------------------------
// ドキュメントのUV情報の初期化
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::InitDocumentUVInfo(WINDOW_SETING &Seting)
{
	// アスペクト比の設定
	m_AspectRatio = Seting.AspectRatio;
	// 大きさの拡縮率の設定
	m_SizeScal    = Seting.SizeScal;

	// 変数宣言
	POLYVERTEXSUVINFO SetingTex;	// テクスチャUV情報
	float             fBaseRat;		// ベースの比率

	// ベースの比率を算出
	fBaseRat         = (m_AspectRatio.x < m_AspectRatio.y) ? m_AspectRatio.x : m_AspectRatio.y;
	// UV座標の大きさを計算
	SetingTex.size.u = m_SizeScal.x * (fBaseRat / m_AspectRatio.x);
	SetingTex.size.v = m_SizeScal.y * (fBaseRat / m_AspectRatio.y);
	// UV座標の初期位置を算出(*0.5は大きさを中央にするため)
	SetingTex.pos.u  = SetingTex.size.u * MYLIB_HALF_SIZE;
	SetingTex.pos.v  = SetingTex.size.v * MYLIB_HALF_SIZE;
	// 頂点情報の更新
	m_pUi[TYPE_WINDOW]->UpdateVertex(NULL, NULL, NULL, &SetingTex);

	// スクロール初期値位置の設定
	m_fScrInitPos    = SetingTex.pos.v;
}

//-------------------------------------------------------------------------------------------------------------
// 出現準備
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::PreparingAppear(void)
{
	// テクスチャを設定
	m_pUi[TYPE_WINDOW]->SetDispFlag(true);
	m_pUi[TYPE_WINDOW]->SetSize(MYLIB_VEC2_UNSET);
	m_pUi[TYPE_WINDOW]->UpdateVertex(true);

	for (int nCntUi = TYPE_CLOSEBUTTON; nCntUi < TYPE_MAX; nCntUi++)
	{
		m_pUi[nCntUi]->SetDispFlag(true);
		m_pUi[nCntUi]->SetPos(m_pUi[nCntUi]->GetParent()->pParent->GetPos());
		m_pUi[nCntUi]->SetSize(MYLIB_VEC2_UNSET);
		m_pUi[nCntUi]->UpdateVertex(true);
	}
}

//-------------------------------------------------------------------------------------------------------------
// 出現
//-------------------------------------------------------------------------------------------------------------
bool CDecodingWindow::Appearance(void)
{
	// フレームの更新
	if (UpdateFrame())
	{// 前面を表示
		Display();
		return true;
	}
	// 出現の更新
	UpdateAppear();

	return false;
}

//-------------------------------------------------------------------------------------------------------------
// 消滅
//-------------------------------------------------------------------------------------------------------------
bool CDecodingWindow::Disappearance(void)
{
	// フレームの更新
	if (UpdateFrame())
	{// 前面を表示させない
		DoNotDisplay();
		return true;
	}
	// 出現の更新
	UpdateAppear();

	return false;
}

//-------------------------------------------------------------------------------------------------------------
// 表示させる
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::Display(void)
{
	// ウィンドウの更新
	m_pUi[TYPE_WINDOW]->SetSize(m_Seting[TYPE_WINDOW].size);
	m_pUi[TYPE_WINDOW]->UpdateVertex(true);
	// そのほかの更新
	for (int nCntUi = TYPE_CLOSEBUTTON; nCntUi < TYPE_MAX; nCntUi++)
	{
		m_pUi[nCntUi]->SetPos(m_pUi[nCntUi]->GetParent()->pParent->GetPos() + m_pUi[nCntUi]->GetParent()->vecParent);
		m_pUi[nCntUi]->SetSize(m_Seting[nCntUi].size);
		m_pUi[nCntUi]->UpdateVertex(true);
	}
}

//-------------------------------------------------------------------------------------------------------------
// 表示させない
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::DoNotDisplay(void)
{
	// ウィンドウの更新
	m_pUi[TYPE_WINDOW]->SetDispFlag(false);
	// そのほかの更新
	for (int nCntUi = TYPE_CLOSEBUTTON; nCntUi < TYPE_MAX; nCntUi++)
	{
		m_pUi[nCntUi]->SetDispFlag(false);
	}
}

//-------------------------------------------------------------------------------------------------------------
// ウィンドウテクスチャの設定
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::SetWindowTexture(int nIndex)
{
	// テクスチャが範囲内の時
	if (Mlf_InRange(nIndex, TEX_W_MAX, TEX_W_NONE))
	{
		m_pUi[TYPE_WINDOW]->BindTexture(m_pDocTexture[nIndex]);
	}
}

//-------------------------------------------------------------------------------------------------------------
// 閉じるボタンの処理
//-------------------------------------------------------------------------------------------------------------
bool CDecodingWindow::CloseButtonProc(CMouse *pMouse, D3DXVECTOR2 *pMousePos)
{
	//閉じるボタンの取得
	CDecodingUI *pCloseButton = m_pUi[TYPE_CLOSEBUTTON].get();

	// 2Dの衝突判定
	if (pCloseButton->Collision2D(*pMousePos) == true)
	{
		// マウスを押したとき
		if (pMouse->GetTrigger(0))
		{
			// 色を変更
			ChangeColor(pCloseButton, m_aChgCol[CHGCOL_CB_PUSH]);
			// 選択されている番号を閉じるボタンにする
			m_nSelectIndex = TYPE_CLOSEBUTTON;
		}

		// 右クリックを離した時かつ選択された番号と同じとき
		if (pMouse->GetRelease(0) &&
			m_nSelectIndex == TYPE_CLOSEBUTTON)
		{// 色を変更
			ChangeColor(pCloseButton, m_Seting[TYPE_CLOSEBUTTON].col);
			m_nSelectIndex = TYPE_NONE;
			return true;
		}
	}
	else
	{
		// 右クリックを離した時
		if (pMouse->GetRelease(0))
		{// 色を変更
			ChangeColor(pCloseButton, m_Seting[TYPE_CLOSEBUTTON].col);
			m_nSelectIndex = TYPE_NONE;
			return false;
		}
	}

	return false;
}

//-------------------------------------------------------------------------------------------------------------
// スクロール処理
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::ScrollProc(CMouse * pMouse, D3DXVECTOR2 * pMousePos)
{
	// スクロールハンドルを動かす
	MoveScrollHandle(pMouse, pMousePos);
	// マウスホイールスクロール
	MouseWheelScroll(pMousePos);
}

//-------------------------------------------------------------------------------------------------------------
// スクロールハンドルを動かす
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::MoveScrollHandle(CMouse * pMouse, D3DXVECTOR2 * pMousePos)
{
	// スクロールハンドルの取得
	CDecodingUI *pScrollHandle = m_pUi[TYPE_SCROLLHANDLE].get();

	// マウスがハンドルに接触しているかどうか
	if (pScrollHandle->Collision2D(*pMousePos) == true)
	{
		// マウスが押されたとき
		if (pMouse->GetTrigger(0))
		{
			// 選択されている番号に代入
			m_nSelectIndex = TYPE_SCROLLHANDLE;
			// 色を変更
			ChangeColor(pScrollHandle, m_aChgCol[CHGCOL_SH_PINCH]);
			// つまんだ点から中心へのベクトル
			m_VecPinch_Center = VEC2(pScrollHandle->GetPos().x - pMousePos->x, pScrollHandle->GetPos().y - pMousePos->y);
		}
		// それ以外
		else if (m_nSelectIndex == TYPE_NONE)
		{
			// 状態が切り替わったとき
			if (pScrollHandle->GetStateSwitchFlag() == true)
			{
				// 色を変更
				ChangeColor(pScrollHandle, m_aChgCol[CHGCOL_SH_OVERLAP]);
			}
		}
	}

	// マウスが押されている時かつ選択されている番号がハンドルの時
	if (pMouse->GetPress(0) && m_nSelectIndex == TYPE_SCROLLHANDLE)
	{
		// スクロールハンドルを動かす
		ScrollHandleMove(pMousePos, pMousePos->y + m_VecPinch_Center.y);
		// ドキュメントをスクロールする
		ScrollScreen();
	}
	// 選択されている番号がハンドルの時
	else if (pMouse->GetRelease(0))
	{
		if (pScrollHandle->GetState() == CDecodingUI::STATE_OVERLAP)
		{
			// 色を変更
			ChangeColor(pScrollHandle, m_aChgCol[CHGCOL_SH_OVERLAP]);
		}
		else
		{
			// 通常色に戻す
			ChangeColor(pScrollHandle, m_Seting[TYPE_SCROLLHANDLE].col);
		}
		// 選択されている番号を初期化
		m_nSelectIndex = TYPE_NONE;
	}
	// 状態が通常の時かつ状態が切り替わった時
	else if(pScrollHandle->GetState() == CDecodingUI::STATE_NORMAL &&
		pScrollHandle->GetStateSwitchFlag() == true)
	{
		// 通常色に戻す
		ChangeColor(pScrollHandle, m_Seting[TYPE_SCROLLHANDLE].col);
	}
}

//-------------------------------------------------------------------------------------------------------------
// マウスホイールでスクロール
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::MouseWheelScroll(D3DXVECTOR2 * pMousePos)
{
	// 選択されていない時
	if (m_nSelectIndex != TYPE_NONE)
	{// 処理を抜ける
		return;
	}
	// スクロール値を取得
	int nScrollValu = CMouse::GetScrollValue();
	// スクロールされていない時
	if (nScrollValu == 0)
	{// 処理を抜ける
		return;
	}
	// スクロールハンドルを動かす
	ScrollHandleMove(pMousePos, m_pUi[TYPE_SCROLLHANDLE]->GetPos().y -= nScrollValu * m_fWheelForth);
	// ドキュメントをスクロールする
	ScrollScreen();
}

//-------------------------------------------------------------------------------------------------------------
// スクロールハンドルを動かす
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::ScrollHandleMove(D3DXVECTOR2 * pMousePos, float fPosY)
{
	// 範囲内の値を設定
	m_pUi[TYPE_SCROLLHANDLE]->SetPosY(ScrollClamp(pMousePos, fPosY));
	// 親情報を再設定
	m_pUi[TYPE_SCROLLHANDLE]->SetParent(m_pUi[TYPE_SCROLLHANDLE]->GetParent()->pParent);
	// 頂点情報の更新
	m_pUi[TYPE_SCROLLHANDLE]->UpdateVertex(true);
}

//-------------------------------------------------------------------------------------------------------------
// スクロールのクランプ
//-------------------------------------------------------------------------------------------------------------
float CDecodingWindow::ScrollClamp(D3DXVECTOR2 * pMousePos, float& fPosY)
{
	// スクロールバーの取得
	CDecodingUI * pScrollBar    = m_pUi[TYPE_SCROLLBAR].get();
	// スクロールハンドルの取得
	CDecodingUI * pScrollHandle = m_pUi[TYPE_SCROLLHANDLE].get();

	// 枠内に収める
	if (pScrollBar->GetPos().y + pScrollBar->GetSize().y *MYLIB_HALF_SIZE <= fPosY + pScrollHandle->GetSize().y*MYLIB_HALF_SIZE)
	{
		fPosY = (pScrollBar->GetPos().y + pScrollBar->GetSize().y*MYLIB_HALF_SIZE - (pScrollHandle->GetSize().y*MYLIB_HALF_SIZE));
		m_VecPinch_Center = VEC2(pScrollHandle->GetPos().x - pMousePos->x, fPosY - pMousePos->y);
	}
	if (pScrollBar->GetPos().y - pScrollBar->GetSize().y *MYLIB_HALF_SIZE >= fPosY - pScrollHandle->GetSize().y*MYLIB_HALF_SIZE)
	{
		fPosY = (pScrollBar->GetPos().y - pScrollBar->GetSize().y*MYLIB_HALF_SIZE + (pScrollHandle->GetSize().y*MYLIB_HALF_SIZE));
		m_VecPinch_Center = VEC2(pScrollHandle->GetPos().x - pMousePos->x, fPosY - pMousePos->y);
	}

	return fPosY;
}

//-------------------------------------------------------------------------------------------------------------
// 画面をスクロール
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::ScrollScreen(void)
{
	// テクスチャUV情報を取得
	POLYVERTEXSUVINFO *pTex = m_pUi[TYPE_WINDOW]->GetTex();
	// ベクトルを計算
	float fVec = m_pUi[TYPE_SCROLLHANDLE]->GetPos().y - (m_pUi[TYPE_SCROLLBAR]->GetPos().y + m_ScrollRange.min);
	// スケールを計算
	float fScal = 1.0f - (m_fScrInitPos + m_fScrInitPos);
	// UV位置を設定
	pTex->pos.v = m_fScrInitPos + (fScal *  (fVec / m_fScrollRangeValue));
	// 頂点情報の更新
	m_pUi[TYPE_WINDOW]->UpdateVertex(false, false, true);
}

//-------------------------------------------------------------------------------------------------------------
// 設定の初期化
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::InitSeting(WINDOW_SETING &Seting)
{
	// 初期化
	SETINGINFO *pInit = &m_InitSeting[0];		// 初期設定情報のポインタ
	SETINGINFO *pSet  = &m_Seting[0];			// 設定情報のポインタ

	pSet[TYPE_WINDOW] = pInit[TYPE_WINDOW];		// 初期設定
	pSet[TYPE_WINDOW] = Seting;					// ウィンドウの設定を反映

	for (int nCntType = TYPE_CLOSEBUTTON; nCntType < TYPE_MAX; nCntType++)
	{
		pSet[nCntType] = pInit[nCntType];
	}
}

//-------------------------------------------------------------------------------------------------------------
// UIの作成
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::MakeUI(void)
{
	// ウィンドウのUIの生成
	m_pUi[TYPE_WINDOW] = CDecodingUI::Create(m_Seting[TYPE_WINDOW]);
	m_pUi[TYPE_WINDOW]->BindTexture(m_pDocTexture[TEX_W_TELLTHEPICTURE]);
	// ループ
	for (int nCntType = TYPE_CLOSEBUTTON; nCntType < TYPE_MAX; nCntType++)
	{// UIの生成
		m_pUi[nCntType] = CDecodingUI::Create(m_Seting[nCntType]);
		m_pUi[nCntType]->BindTexture(m_pTexture[nCntType - 1]);
	}
}

//-------------------------------------------------------------------------------------------------------------
// 親に従って位置を設定する
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::SetPosAccordingParent(void)
{
	// 変数宣言
	SETINGINFO* pSet = &m_Seting[0];				// 設定情報のポインタ
	// ループ
	for (int nCntType = 0; nCntType < TYPE_MAX; nCntType++)
	{
		// 親IDの取得
		int nParentID = pSet[nCntType].nParentID;
		if (nParentID != -1)
		{	// 位置を設定する
			m_pUi[nCntType]->SetPos(m_pUi[nParentID]->GetPos() + pSet[nCntType].pos);
			// 親情報の設定
			m_pUi[nCntType]->SetParent(m_pUi[nParentID].get());
			// 頂点情報の更新
			m_pUi[nCntType]->UpdateVertex(true);
		}
	}
}

//-------------------------------------------------------------------------------------------------------------
// 出現の更新
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::UpdateAppear(void)
{
	// 拡大値を加算
	m_fScal += m_fScalValue;
	// ウィンドウの更新
	m_pUi[TYPE_WINDOW]->SetSize(m_Seting[TYPE_WINDOW].size *m_fScal);
	// 頂点の更新
	m_pUi[TYPE_WINDOW]->UpdateVertex(true);
	// そのほかの更新
	for (int nCntUi = TYPE_CLOSEBUTTON; nCntUi < TYPE_MAX; nCntUi++)
	{// 位置を設定
		m_pUi[nCntUi]->SetPos(m_pUi[nCntUi]->GetParent()->pParent->GetPos() + m_pUi[nCntUi]->GetParent()->vecParent * m_fScal);
		// 大きさの設定
		m_pUi[nCntUi]->SetSize(m_Seting[nCntUi].size *m_fScal);
		// 頂点の更新
		m_pUi[nCntUi]->UpdateVertex(true);
	}
}

//-------------------------------------------------------------------------------------------------------------
// フレームの更新
//-------------------------------------------------------------------------------------------------------------
bool CDecodingWindow::UpdateFrame(void)
{
	// フレームカウントを加算
	m_nFrame++;
	// フレームが最大以上の時
	if (m_nFrame > m_nFrameMax)
	{// フレームの初期化
		m_nFrame = MYLIB_INT_UNSET;
		return true;
	}
	return false;
}

//-------------------------------------------------------------------------------------------------------------
// 色を変更
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::ChangeColor(CDecodingUI * pUi, D3DXCOLOR & col)
{
	// 頂点情報の更新
	pUi->UpdateVertex(NULL, NULL, &col);
}

//-------------------------------------------------------------------------------------------------------------
// 1行から情報を読み取る
//-------------------------------------------------------------------------------------------------------------
void CDecodingWindow::ReadFromLine(CONST_STRING cnpLine, CONST_STRING cnpEntryType, CONST_STRING cnpEntryData)
{
	// 変数宣言
	D3DXVECTOR3 pos                     = MYLIB_3DVECTOR_ZERO;				// 位置
	D3DXVECTOR2 size                    = MYLIB_2DVECTOR_ZERO;				// 大きさ
	D3DXCOLOR   col                     = MYLIB_D3DXCOR_SET;				// 色
	float       fData                   = MYLIB_FLOAT_UNSET;				// float型のデータ
	int         nData                   = MYLIB_INT_UNSET;					// int型のデータ
	char        sData[MYLIB_STRINGSIZE] = Mlf_array(MYLIB_CHAR_UNSET);	// 文字列のデータ
	SETINGINFO* pSet                    = nullptr;							// 設定情報のポインタ

	if (strcmp(cnpEntryType, "SetUp") == 0)
	{
		if (sscanf(cnpLine, "ModeCount = %d", &nData) == 1)
		{
			m_nFrameMax = nData;
		}
		else if (sscanf(cnpLine, "CloseButtonPush = %f %f %f %f", &col.r, &col.g, &col.b, &col.a) == 4)
		{
			m_aChgCol[CHGCOL_CB_PUSH] = col;
		}
		else if (sscanf(cnpLine, "ScrollHandlePitch = %f %f %f %f", &col.r, &col.g, &col.b, &col.a) == 4)
		{
			m_aChgCol[CHGCOL_SH_PINCH] = col;
		}
		else if (sscanf(cnpLine, "ScrollHandleOverlap = %f %f %f %f", &col.r, &col.g, &col.b, &col.a) == 4)
		{
			m_aChgCol[CHGCOL_SH_OVERLAP] = col;
		}
		else if (sscanf(cnpLine, "WheelForth = %f", &fData) == 1)
		{
			m_fWheelForth = fData;
		}
	}
	else
	{
		pSet = &m_InitSeting[atoi(m_pHash->Search((char*)cnpEntryType))];
		if (sscanf(cnpLine, "pos = %f %f", &pos.x, &pos.y) == 2)
		{
			pSet->pos = pos;
		}
		else if (sscanf(cnpLine, "size = %f %f", &size.x, &size.y) == 2)
		{
			pSet->size = size;
		}
		else if (sscanf(cnpLine, "col = %f %f %f %f", &col.r, &col.g, &col.b, &col.a) == 4)
		{
			pSet->col = col;
		}
		else if (sscanf(cnpLine, "angle = %f", &fData) == 1)
		{
			pSet->fAngle = fData;
		}
		else if (sscanf(cnpLine, "originType = %d", &nData) == 1)
		{
			pSet->OriginType = (ORIGINVERTEXTYPE)nData;
		}
		else if (sscanf(cnpLine, "disp = %d", &nData) == 1)
		{
			pSet->bDisp = (nData == 1);
		}
		else if (sscanf(cnpLine, "Parent = %s", &sData[0]) == 1)
		{
			pSet->nParentID = atoi(m_pHash->Search(sData));
		}
	}
}
