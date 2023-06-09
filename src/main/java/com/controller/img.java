package com.controller;

import com.entity.Admin;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.ClassUtils;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.io.*;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

/**
 * @author 游弋
 * @create 2023-06-07 3:43 PM
 */
@Controller
public class img {

    private String picturePath;
//    使用yaml配置对象的方式进行一次设置，持续引用
    @Value("${user.lo}")
    private String FILEPATH;

//    @GetMapping("*.img")
//    public String test(String name) throws FileNotFoundException {
//        Path path = Paths.get("C:\\Users\\yo\\Desktop\\vuespringbootTotalProject\\WebDevelopment\\back\\demo\\src\\main\\resources\\static\\img");
//        String path2=path.toString().replaceAll("\\\\","/")+"/";
//        path2=path2.substring(path2.lastIndexOf("/img"));
//        return path2+name;
//    }

    @RequestMapping("/test/up")
    public ResponseEntity<String> testUp(HttpSession session, MultipartFile photo) throws IOException {
//        获取上传的文件名
        String filename = photo.getOriginalFilename();

//        以下操作是为了保证文件名不重复，文件名重复会导致相同文件名的内容被覆盖
//        获取上传的文件后缀名
        String hzname = filename.substring(filename.lastIndexOf("."));
//        获取uuid,也可以用获取时间戳的方式
        String s = UUID.randomUUID().toString();
//        拼接一个新文件名
        filename = s + hzname;

//        如果运行的项目没有初始数据，是一个崭新的项目，可以直接在配置文件中写入图片文件要保存的地址后进行
//        File file = new File(FILEPATH);
//        if (!file.exists()){
//            boolean mkdirs = file.mkdirs();
//            if (!mkdirs){
//                System.out.println("创建图片文件夹失败");
//            }
//        }


//图片保存方式一  将图片放在项目所在文件夹下的static/img文件夹中，相较于放在运行时文件夹中，此方法优点是将文件保存在开发文件夹，不会因为maven的clean而丢失
//        缺点依旧是无法在打包后获得正确的路径，即只有在开发模式中能正确找到此文件的资源文件夹，但是也要配置静态资源访问目录，不如第三种方式简便，不配置的话需要重启才能看到上传的资源
//        在打包模式下。会获得jar包所在文件夹的路径拼接下列路径同时还要修改配置文件来开放静态资源访问目录，更加繁琐
          //获取路径的两种方式，方式一
//        String property = System.getProperty("user.dir");
//        System.out.println(property);
          //获取路径的两种方式，方式二
//        File file1 = new File("");
//        String absolutePath = file1.getAbsolutePath();
//        absolutePath=absolutePath+"/src/main/resources/static/img";
//         //转换路径符
//        absolutePath.replaceAll("\\\\","/");
//        FILEPATH= absolutePath;

// 图片保存方式二，将图片放在运行时目录下，此时不需要配置静态资源访问目录，但是在开发模式下cleanmaven会导致运行时目录下的文件丢失
//        此种方式无法打包运行，打包运行时运行时文件会在jar包的名称后面加上！
//        String path = ClassUtils.getDefaultClassLoader().getResource("").getPath();
//        path=path+"/static/img";
//        //转换路径符
//        path.replaceAll("\\\\","/");
//        FILEPATH= path.substring(path.indexOf("C"));

// 图片保存方式三，将图片文件夹路径剥离出来，将地址放入配置文件，在使用的类中@value注入配置文件的地址，做到一改全改，且在jar包模式下也能正确运行
// 图片文件夹还能单独做代理，可以在日后进行更多的分流
        FILEPATH= FILEPATH.replaceAll("\\\\","/");;

        System.out.println("已经获得当前项目图片文件夹在当前设备的绝对路径："+FILEPATH);
        Path path2 = Paths.get(FILEPATH);
        String finalPath = path2 + File.separator + filename;
        photo.transferTo(new File(finalPath));

//        上传成功后返回成功信息
        picturePath="api/"+filename;
        System.out.println("返回前端的图片请求路径"+picturePath);
        return ResponseEntity.ok(picturePath);
    }
    @RequestMapping("/getPicture")
    private ResponseEntity<String> getPicture(){
        String picture=picturePath;
        return ResponseEntity.ok(picture);
    }
    @RequestMapping("/test/download")
    public ResponseEntity<byte[]> testResponseEntity(HttpSession session) throws IOException {
//        Path path2 = Paths.get("C:\\Users\\yo\\Desktop\\vuespringbootTotalProject\\WebDevelopment\\back\\demo\\src\\main\\resources\\static\\img");
        Path path2 = Paths.get(FILEPATH);
//        因为返回去的 api/，正好4个可以截断api/
        String name=picturePath.substring(4);
        System.out.println(name+"图片下载的图片名称");
        System.out.println(path2+"将要在这个地址进行下载");
        String finalPath = path2 + File.separator + name;
        System.out.println(finalPath+"最终下载路径以及图片名");
//创建输入流
        InputStream is = new FileInputStream(finalPath);
//创建字节数组，is.availiable,获取输入流所对应文件的字节数
        byte[] bytes = new byte[is.available()];
//将流读到字节数组中
        is.read(bytes);

//创建HttpHeaders对象设置响应头信息
        MultiValueMap<String, String> headers = new HttpHeaders();
//设置要下载方式以及下载文件的名字,  content-Disposition,attachment:filename=是固定格式
        headers.add("Content-Disposition", "attachment;filename="+name);
//设置响应状态码
        HttpStatus statusCode = HttpStatus.OK;
//创建ResponseEntity对象
        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(bytes, headers,
                statusCode);
//关闭输入流
        is.close();
        return responseEntity;
    }
}
