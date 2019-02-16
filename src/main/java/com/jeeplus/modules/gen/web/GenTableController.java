/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jeeplus.modules.gen.web;

import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.web.BaseController;
import com.jeeplus.modules.gen.entity.GenTable;
import com.jeeplus.modules.gen.service.GenTableService;
import com.jeeplus.modules.gen.util.GenUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * 业务表Controller
 * @author ThinkGem
 * @version 2013-10-15
 */
@Controller
@RequestMapping(value = "${adminPath}/gentable/genTable")
public class GenTableController extends BaseController {

	@Autowired
	private GenTableService genTableService;
	
	@ModelAttribute
	public GenTable get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return genTableService.get(id);
		}else{
			return new GenTable();
		}
	}
	
	@RequiresPermissions("gen:genTable:list")
	@RequestMapping(value = {"list", ""})
	public String list(GenTable genTable, HttpServletRequest request, HttpServletResponse response, Model model) {
//		System.out.println("1111111111111111111111");
//		User user = UserUtils.getUser();
//		if (!user.isAdmin()){
//			genTable.setCreateBy(user);
//		}
//        Page<GenTable> page = genTableService.find(new Page<GenTable>(request, response), genTable);
//        model.addAttribute("page", page);
		model.addAttribute("genTable", genTable);
		return "modules/gen/tableList";
	}

	@ResponseBody
	@RequiresPermissions("gen:genTable:list")
	@RequestMapping(value = "data")
	public Map<String, Object> data(GenTable genTable, boolean isSelf, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<GenTable> page = genTableService.findPage(new Page<GenTable>(request, response), genTable);
		return getBootstrapData(page);
	}
//	/**
//	 * 查看，增加，编辑表生成表单页面
//	 */
//	@RequiresPermissions(value={"gentable:genTable:view","gentable:genTable:add","gentable:genTable:edit"},logical= Logical.OR)
//	@RequestMapping(value = "form")
//	public String form(GenTable genTable, Model model) {
//		model.addAttribute("genTable", genTable);
//		return "modules/gentable/genTableForm";
//	}

	@RequiresPermissions(value={"gentable:genTable:add"})
	@RequestMapping(value = "form")
	public String form(GenTable genTable, Model model) {
		// 获取物理表列表

		// 验证表是否存在
		if (StringUtils.isBlank(genTable.getId()) && !genTableService.checkTableName(genTable.getName())){
			addMessage(model, "下一步失败！" + genTable.getName() + " 表已经添加！");
			genTable.setName("");
		}
		// 获取物理表字段
		else{
			genTable = genTableService.getTableFormDb(genTable);
		}
		model.addAttribute("genTable", genTable);
		model.addAttribute("config", GenUtils.getConfig());
		return "modules/gen/tableForm";
	}

	@RequiresPermissions(value={"gentable:genTable:view","gentable:genTable:edit"},logical= Logical.OR)
	@RequestMapping(value = "formViewEdit")
	public String formViewEdit(GenTable genTable, Model model) {
		// 获取物理表列表

		// 验证表是否存在
		if (StringUtils.isBlank(genTable.getId()) && !genTableService.checkTableName(genTable.getName())){
			addMessage(model, "下一步失败！" + genTable.getName() + " 表已经添加！");
			genTable.setName("");
		}
		// 获取物理表字段
		else{
			genTable = genTableService.getTableFormDb(genTable);
		}
		model.addAttribute("genTable", genTable);
		model.addAttribute("config", GenUtils.getConfig());
		return "modules/gen/tableFormEdit";
	}

	@RequiresPermissions("gen:genTable:edit")
	@RequestMapping(value = "save")
	public String save(Model model, RedirectAttributes redirectAttributes,@RequestParam(value = "names[]") String[] names) {
//		if (!beanValidator(model, genTable)){
//			return form(genTable, model);
//		}
		// 验证表是否已经存在
		GenTable genTable =new GenTable();
		System.out.println(names.toString());
		for(String name :names) {
			genTable.setName(name);
			if (!genTableService.checkTableName(name)) {
				addMessage(model, "保存失败！" + name + " 表已经存在！");

				return form(genTable, model);
			}
			GenTable genTable1 = genTableService.findUniqueByProperty("name","name");
			if(genTable1 == null){
				genTableService.save(genTable);
			}else{

			}

		}
		addMessage(redirectAttributes, "保存业务表'" + genTable.getName() + "'成功");
		return "redirect:" + adminPath + "/gen/genTable/?repage";
	}
	
	@RequiresPermissions("gen:genTable:edit")
	@RequestMapping(value = "delete")
	public String delete(GenTable genTable, RedirectAttributes redirectAttributes) {
		genTableService.delete(genTable);
		addMessage(redirectAttributes, "删除业务表成功");
		return "redirect:" + adminPath + "/gen/genTable/?repage";
	}


	@RequiresPermissions("gen:genTable:importDb")
	@RequestMapping(value = "importDbSelect")
	public String importDbSelect(GenTable genTable, Model model, RedirectAttributes redirectAttributes) {
		List<GenTable> tableList = genTableService.findTableListFormDb(new GenTable());
		model.addAttribute("tableList", tableList);
		return "modules/gen/importDb";
	}



}
