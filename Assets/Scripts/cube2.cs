﻿using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;
using UnityEngine.EventSystems;
using System.Collections;
using ExcelData.DirectReading;

public class cube2 : MonoBehaviour
{
    //    public Transform cube;
    bool isShowTip;
    public string lname;
    public bool WindowShow = false;
    private Btn_control btn;
    public bool x = false;
    public int sum = 0;
    public GameObject biaoti;
    //    // Use this for initialization
    void Start()
    {
        isShowTip = false;
        lname = this.gameObject.name;//当前物体的名字

    }
    public void Update()
    {

    }
    //放置鼠标 显示名字
    void OnMouseEnter()
    {
        if (!EventSystem.current.IsPointerOverGameObject())
        {
            isShowTip = true;
        }
        else
        {
            isShowTip = false;
        }


    }
    //点击鼠标 获取名字
  
    //移除鼠标 消失
    void OnMouseExit()
    {
        isShowTip = false;
    }
    void OnGUI()
    {
        if (isShowTip)
        {
            GUIStyle style1 = new GUIStyle();
            style1.fontSize = 30;
            style1.normal.textColor = Color.red;
            GUI.Label(new Rect(Input.mousePosition.x, Screen.height - Input.mousePosition.y, 400, 50), lname, style1);

        }
    }

}
