using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class kuosan2 : MonoBehaviour
{
    public GameObject kuosan1;
    float timer = 5f;
    public InputField inputDeviceId;
    public InputField inputModelName;
    public InputField inputDeviceModel;
    public InputField inputEquipmentType;
    public InputField inputProductionDate;
    public InputField inputManufacturer;
    public InputField inputStorageLocation;
    //public InputField StorageLocation;

    private string DeviceId;
    private string modelName;
    private string DeviceModel;
    private string EquipmentType;
    private string ProductionDate;
    private string Manufacturer;
    private string StorageLocation;
    //private string QiYongShiJian;

    static float time1;
    private float V;
    public Text text;
    danger_area1 Du;
    void Start()
    {

        Du = GameObject.Find("Main Camera").GetComponent<danger_area1>();

    }



    // Update is called once per frame
    void Update()
    {


    }
    public void kuosan11()
    {
        Debug.Log("运行到开始");
        DeviceId = Convert.ToString(inputDeviceId.text);
        modelName = Convert.ToString(inputModelName.text);
        DeviceModel = Convert.ToString(inputDeviceModel.text);
        EquipmentType = Convert.ToString(inputEquipmentType.text);
        ProductionDate = Convert.ToString(inputProductionDate.text);
        Manufacturer = Convert.ToString(inputManufacturer.text);
        StorageLocation = Convert.ToString(inputStorageLocation.text);
        //QiYongShiJian = Convert.ToString(inputQiYongShiJian.text);

        FileUpLoadController.DeviceId = DeviceId;
        FileUpLoadController.modelName = modelName;
        FileUpLoadController.DeviceModel = DeviceModel;
        FileUpLoadController.EquipmentType = EquipmentType;
        FileUpLoadController.ProductionDate = ProductionDate;
        FileUpLoadController.Manufacturer = Manufacturer;
        FileUpLoadController.StorageLocation = StorageLocation;
        //FileUpLoadController.QiYongShiJian = QiYongShiJian;
        Debug.Log("运行到此处");
        new FileUpLoadController().ModelUpLoad();
    }
}
