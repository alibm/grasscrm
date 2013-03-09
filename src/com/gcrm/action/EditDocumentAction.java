/**
 * Copyright (C) 2012, Grass CRM Inc
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.gcrm.action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.gcrm.domain.Account;
import com.gcrm.domain.Case;
import com.gcrm.domain.Contact;
import com.gcrm.domain.Document;
import com.gcrm.domain.DocumentCategory;
import com.gcrm.domain.DocumentStatus;
import com.gcrm.domain.DocumentSubCategory;
import com.gcrm.domain.Opportunity;
import com.gcrm.domain.User;
import com.gcrm.service.IBaseService;
import com.gcrm.service.IDocumentService;
import com.gcrm.service.IOptionService;
import com.gcrm.util.BeanUtil;
import com.gcrm.util.CommonUtil;
import com.gcrm.util.Constant;
import com.gcrm.util.security.UserUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.Preparable;

/**
 * Edits Document
 * 
 */
public class EditDocumentAction extends BaseEditAction implements Preparable {

    private static final long serialVersionUID = -2404576552417042445L;

    private IDocumentService baseService;
    private IOptionService<DocumentStatus> documentStatusService;
    private IOptionService<DocumentCategory> documentCategoryService;
    private IOptionService<DocumentSubCategory> documentSubCategoryService;
    private IBaseService<Account> accountService;
    private IBaseService<Contact> contactService;
    private IBaseService<Opportunity> opportunityService;
    private IBaseService<Case> caseService;
    private IBaseService<User> userService;
    private Document document;
    private List<DocumentStatus> statuses;
    private List<DocumentCategory> categories;
    private List<DocumentSubCategory> subCategories;
    private Integer statusID = null;
    private Integer categoryID = null;
    private Integer subCategoryID = null;
    private Integer relatedDocumentID = null;
    private String relatedDocumentText = null;
    private Integer assignedToID = null;
    private String assignedToText = null;
    private String publishDateS = null;
    private String expirationDateS = null;
    private File upload;
    private String uploadFileName;
    private String uploadContentType;
    private String fileName;

    /**
     * Saves the entity.
     * 
     * @return the SUCCESS result
     */
    public String save() throws Exception {
        saveEntity();
        File file = this.getUpload();
        document = this.baseService.save(document, file);
        this.setId(document.getId());
        this.setSaveFlag("true");
        return SUCCESS;
    }

    /**
     * Gets the entity.
     * 
     * @return the SUCCESS result
     */
    public String get() throws Exception {
        if (this.getId() != null) {
            document = baseService.getEntityById(Document.class, this.getId());
            DocumentStatus status = document.getStatus();
            if (status != null) {
                statusID = status.getId();
            }
            DocumentCategory category = document.getCategory();
            if (category != null) {
                categoryID = category.getId();
            }

            DocumentSubCategory subCategory = document.getSub_category();
            if (subCategory != null) {
                subCategoryID = subCategory.getId();
            }

            User assignedTo = document.getAssigned_to();
            if (assignedTo != null) {
                assignedToID = assignedTo.getId();
                assignedToText = assignedTo.getName();
            }
            Document relatedDocument = document.getRelated_document();
            if (relatedDocument != null) {
                relatedDocumentID = relatedDocument.getId();
                relatedDocumentText = relatedDocument.getName();
            }
            Date publishDate = document.getPublish_date();
            SimpleDateFormat dateFormat = new SimpleDateFormat(
                    Constant.DATE_EDIT_FORMAT);
            if (publishDate != null) {
                publishDateS = dateFormat.format(publishDate);
            }
            Date expirationDate = document.getExpiration_date();
            if (expirationDate != null) {
                expirationDateS = dateFormat.format(expirationDate);
            }
            this.getBaseInfo(document);
        } else {
            this.initBaseInfo();
        }
        return SUCCESS;
    }

    /**
     * Mass update entity record information
     */
    public String massUpdate() throws Exception {
        saveEntity();
        String[] fieldNames = this.massUpdate;
        if (fieldNames != null) {
            String[] selectIDArray = this.seleteIDs.split(",");
            Collection<Document> documents = new ArrayList<Document>();
            User loginUser = this.getLoginUser();
            User user = userService
                    .getEntityById(User.class, loginUser.getId());
            for (String IDString : selectIDArray) {
                int id = Integer.parseInt(IDString);
                Document documentInstance = this.baseService.getEntityById(
                        Document.class, id);
                for (String fieldName : fieldNames) {
                    Object value = BeanUtil.getFieldValue(document, fieldName);
                    BeanUtil.setFieldValue(documentInstance, fieldName, value);
                }
                documentInstance.setUpdated_by(user);
                documentInstance.setUpdated_on(new Date());
                documents.add(documentInstance);
            }
            if (documents.size() > 0) {
                this.baseService.batchUpdate(documents);
            }
        }
        return SUCCESS;
    }

    /**
     * Saves entity field
     * 
     * @throws ParseException
     */
    private void saveEntity() throws Exception {
        if (document.getId() == null) {
            UserUtil.permissionCheck("create_document");
        } else {
            UserUtil.permissionCheck("update_document");
            Document originalDocument = baseService.getEntityById(
                    Document.class, document.getId());
            document.setContacts(originalDocument.getContacts());
            document.setCases(originalDocument.getCases());
            document.setAccounts(originalDocument.getAccounts());
            document.setOpportunities(originalDocument.getOpportunities());
        }

        DocumentStatus status = null;
        if (statusID != null) {
            status = documentStatusService.getEntityById(DocumentStatus.class,
                    statusID);
        }
        document.setStatus(status);

        DocumentCategory category = null;
        if (categoryID != null) {
            category = documentCategoryService.getEntityById(
                    DocumentCategory.class, categoryID);
        }
        document.setCategory(category);

        DocumentSubCategory subCategory = null;
        if (subCategoryID != null) {
            subCategory = documentSubCategoryService.getEntityById(
                    DocumentSubCategory.class, subCategoryID);
        }
        document.setSub_category(subCategory);
        User assignedTo = null;
        if (assignedToID != null) {
            assignedTo = userService.getEntityById(User.class, assignedToID);
        }
        document.setAssigned_to(assignedTo);
        User owner = null;
        if (this.getOwnerID() != null) {
            owner = userService.getEntityById(User.class, this.getOwnerID());
        }
        document.setOwner(owner);
        Document relatedDocument = null;
        if (relatedDocumentID != null) {
            relatedDocument = baseService.getEntityById(Document.class,
                    relatedDocumentID);
        }
        document.setRelated_document(relatedDocument);
        SimpleDateFormat dateFormat = new SimpleDateFormat(
                Constant.DATE_EDIT_FORMAT);
        Date publishDate = null;
        if (!CommonUtil.isNullOrEmpty(publishDateS)) {
            publishDate = dateFormat.parse(publishDateS);
        }
        document.setPublish_date(publishDate);
        Date expirationDate = null;
        if (!CommonUtil.isNullOrEmpty(expirationDateS)) {
            expirationDate = dateFormat.parse(expirationDateS);
        }
        document.setExpiration_date(expirationDate);

        document.setFileName(this.uploadFileName);

        if ("Account".equals(this.getRelationKey())) {
            Account account = accountService.getEntityById(Account.class,
                    Integer.valueOf(this.getRelationValue()));
            Set<Account> accounts = document.getAccounts();
            if (accounts == null) {
                accounts = new HashSet<Account>();
            }
            accounts.add(account);
        } else if ("Contact".equals(this.getRelationKey())) {
            Contact contact = contactService.getEntityById(Contact.class,
                    Integer.valueOf(this.getRelationValue()));
            Set<Contact> contacts = document.getContacts();
            if (contacts == null) {
                contacts = new HashSet<Contact>();
            }
            contacts.add(contact);
        } else if ("Opportunity".equals(this.getRelationKey())) {
            Opportunity opportunity = opportunityService
                    .getEntityById(Opportunity.class,
                            Integer.valueOf(this.getRelationValue()));
            Set<Opportunity> opportunities = document.getOpportunities();
            if (opportunities == null) {
                opportunities = new HashSet<Opportunity>();
            }
            opportunities.add(opportunity);
        } else if ("Case".equals(this.getRelationKey())) {
            Case caseInstance = caseService.getEntityById(Case.class,
                    Integer.valueOf(this.getRelationValue()));
            Set<Case> cases = document.getCases();
            if (cases == null) {
                cases = new HashSet<Case>();
            }
            cases.add(caseInstance);
        }
        super.updateBaseInfo(document);
    }

    /**
     * Prepares the list
     * 
     */
    public void prepare() throws Exception {
        ActionContext context = ActionContext.getContext();
        Map<String, Object> session = context.getSession();
        String local = (String) session.get("locale");
        this.statuses = documentStatusService.getOptions(
                DocumentStatus.class.getSimpleName(), local);
        this.categories = documentCategoryService.getOptions(
                DocumentCategory.class.getSimpleName(), local);
        this.subCategories = documentSubCategoryService.getOptions(
                DocumentSubCategory.class.getSimpleName(), local);
    }

    /**
     * Imports the document
     * 
     * @return document inputStream
     * 
     */
    public InputStream getInputStream() throws Exception {
        Document document = baseService.getEntityById(Document.class,
                this.getId());
        byte[] file = document.getFileContent();

        InputStream in = new ByteArrayInputStream(file);
        this.setFileName(document.getFileName());
        return in;
    }

    /**
     * @return the baseService
     */
    public IDocumentService getBaseService() {
        return baseService;
    }

    /**
     * @param baseService
     *            the baseService to set
     */
    public void setBaseService(IDocumentService baseService) {
        this.baseService = baseService;
    }

    /**
     * @return the userService
     */
    public IBaseService<User> getUserService() {
        return userService;
    }

    /**
     * @param userService
     *            the userService to set
     */
    public void setUserService(IBaseService<User> userService) {
        this.userService = userService;
    }

    /**
     * @return the document
     */
    public Document getDocument() {
        return document;
    }

    /**
     * @param document
     *            the document to set
     */
    public void setDocument(Document document) {
        this.document = document;
    }

    /**
     * @return the statuses
     */
    public List<DocumentStatus> getStatuses() {
        return statuses;
    }

    /**
     * @param statuses
     *            the statuses to set
     */
    public void setStatuses(List<DocumentStatus> statuses) {
        this.statuses = statuses;
    }

    /**
     * @return the categories
     */
    public List<DocumentCategory> getCategories() {
        return categories;
    }

    /**
     * @param categories
     *            the categories to set
     */
    public void setCategories(List<DocumentCategory> categories) {
        this.categories = categories;
    }

    /**
     * @return the subCategories
     */
    public List<DocumentSubCategory> getSubCategories() {
        return subCategories;
    }

    /**
     * @param subCategories
     *            the subCategories to set
     */
    public void setSubCategories(List<DocumentSubCategory> subCategories) {
        this.subCategories = subCategories;
    }

    /**
     * @return the statusID
     */
    public Integer getStatusID() {
        return statusID;
    }

    /**
     * @param statusID
     *            the statusID to set
     */
    public void setStatusID(Integer statusID) {
        this.statusID = statusID;
    }

    /**
     * @return the categoryID
     */
    public Integer getCategoryID() {
        return categoryID;
    }

    /**
     * @param categoryID
     *            the categoryID to set
     */
    public void setCategoryID(Integer categoryID) {
        this.categoryID = categoryID;
    }

    /**
     * @return the subCategoryID
     */
    public Integer getSubCategoryID() {
        return subCategoryID;
    }

    /**
     * @param subCategoryID
     *            the subCategoryID to set
     */
    public void setSubCategoryID(Integer subCategoryID) {
        this.subCategoryID = subCategoryID;
    }

    /**
     * @return the relatedDocumentID
     */
    public Integer getRelatedDocumentID() {
        return relatedDocumentID;
    }

    /**
     * @param relatedDocumentID
     *            the relatedDocumentID to set
     */
    public void setRelatedDocumentID(Integer relatedDocumentID) {
        this.relatedDocumentID = relatedDocumentID;
    }

    /**
     * @return the assignedToID
     */
    @Override
    public Integer getAssignedToID() {
        return assignedToID;
    }

    /**
     * @param assignedToID
     *            the assignedToID to set
     */
    @Override
    public void setAssignedToID(Integer assignedToID) {
        this.assignedToID = assignedToID;
    }

    /**
     * @return the publishDate
     */
    public String getPublishDateS() {
        return publishDateS;
    }

    /**
     * @param publishDate
     *            the publishDate to set
     */
    public void setPublishDate(String publishDateS) {
        this.publishDateS = publishDateS;
    }

    /**
     * @return the expirationDate
     */
    public String getExpirationDateS() {
        return expirationDateS;
    }

    /**
     * @param expirationDate
     *            the expirationDate to set
     */
    public void setExpirationDateS(String expirationDateS) {
        this.expirationDateS = expirationDateS;
    }

    /**
     * @return the upload
     */
    public File getUpload() {
        return upload;
    }

    /**
     * @param upload
     *            the upload to set
     */
    public void setUpload(File upload) {
        this.upload = upload;
    }

    /**
     * @return the uploadFileName
     */
    public String getUploadFileName() {
        return uploadFileName;
    }

    /**
     * @param uploadFileName
     *            the uploadFileName to set
     */
    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    /**
     * @return the uploadContentType
     */
    public String getUploadContentType() {
        return uploadContentType;
    }

    /**
     * @param uploadContentType
     *            the uploadContentType to set
     */
    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    /**
     * @return the fileName
     */
    public String getFileName() {
        return fileName;
    }

    /**
     * @param fileName
     *            the fileName to set
     */
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    /**
     * @return the accountService
     */
    public IBaseService<Account> getAccountService() {
        return accountService;
    }

    /**
     * @param accountService
     *            the accountService to set
     */
    public void setAccountService(IBaseService<Account> accountService) {
        this.accountService = accountService;
    }

    /**
     * @return the contactService
     */
    public IBaseService<Contact> getContactService() {
        return contactService;
    }

    /**
     * @param contactService
     *            the contactService to set
     */
    public void setContactService(IBaseService<Contact> contactService) {
        this.contactService = contactService;
    }

    /**
     * @return the opportunityService
     */
    public IBaseService<Opportunity> getOpportunityService() {
        return opportunityService;
    }

    /**
     * @param opportunityService
     *            the opportunityService to set
     */
    public void setOpportunityService(
            IBaseService<Opportunity> opportunityService) {
        this.opportunityService = opportunityService;
    }

    /**
     * @return the caseService
     */
    public IBaseService<Case> getCaseService() {
        return caseService;
    }

    /**
     * @param caseService
     *            the caseService to set
     */
    public void setCaseService(IBaseService<Case> caseService) {
        this.caseService = caseService;
    }

    /**
     * @return the relatedDocumentText
     */
    public String getRelatedDocumentText() {
        return relatedDocumentText;
    }

    /**
     * @return the assignedToText
     */
    @Override
    public String getAssignedToText() {
        return assignedToText;
    }

    /**
     * @return the documentStatusService
     */
    public IOptionService<DocumentStatus> getDocumentStatusService() {
        return documentStatusService;
    }

    /**
     * @param documentStatusService
     *            the documentStatusService to set
     */
    public void setDocumentStatusService(
            IOptionService<DocumentStatus> documentStatusService) {
        this.documentStatusService = documentStatusService;
    }

    /**
     * @return the documentCategoryService
     */
    public IOptionService<DocumentCategory> getDocumentCategoryService() {
        return documentCategoryService;
    }

    /**
     * @param documentCategoryService
     *            the documentCategoryService to set
     */
    public void setDocumentCategoryService(
            IOptionService<DocumentCategory> documentCategoryService) {
        this.documentCategoryService = documentCategoryService;
    }

    /**
     * @return the documentSubCategoryService
     */
    public IOptionService<DocumentSubCategory> getDocumentSubCategoryService() {
        return documentSubCategoryService;
    }

    /**
     * @param documentSubCategoryService
     *            the documentSubCategoryService to set
     */
    public void setDocumentSubCategoryService(
            IOptionService<DocumentSubCategory> documentSubCategoryService) {
        this.documentSubCategoryService = documentSubCategoryService;
    }
}
