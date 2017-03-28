import com.haulmont.cuba.core.EntityManager
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.Transaction
import com.haulmont.cuba.core.TypedQuery
import com.haulmont.cuba.core.app.FileStorageAPI
import com.haulmont.cuba.core.entity.FileDescriptor
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.FileStorageException
import com.haulmont.thesis.core.entity.Employee
import org.imgscalr.Scalr

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

/*
 * Copyright (c) 2015 Haulmont Technology Ltd. All Rights Reserved.
 * Haulmont Technology proprietary and confidential.
 * Use is subject to license terms.
 */

/**
 *
 * @author soldatov
 * @version $Id: 150805-1534-createAvatarsFromEmployeePhotos.groovy 21870 2015-09-24 15:17:47Z tsarev $
 */

postUpdate.add({
    Transaction tx = AppBeans.get(Persistence.class).createTransaction()
    EntityManager em = AppBeans.get(Persistence.class).getEntityManager()
    FileStorageAPI fileStorageService = AppBeans.get(FileStorageAPI.NAME)
    try {
        TypedQuery<Employee> employeeQuery =
                em.createQuery("select e from df\$Employee e where e.photo.id is not null", Employee.class)
        List<Employee> employees = employeeQuery.getResultList()
        for (Employee employee : employees) {

            FileDescriptor photoFileDescriptor = employee.getPhoto()
            try {
                byte[] file
                try {
                    file = fileStorageService.loadFile(photoFileDescriptor)
                } catch (FileStorageException e) {
                    log.error("Cannot load photo file for employee: " + employee.getName() + " (" + employee.getId() + ")")
                    continue
                }

                BufferedImage img = ImageIO.read(new ByteArrayInputStream(file))
                if (img.getWidth() != img.getHeight()) {
                    int min = Math.min(img.getHeight(), img.getWidth())
                    img = Scalr.crop(img, min, min)
                }
                BufferedImage avatarImg = Scalr.resize(img, Scalr.Method.ULTRA_QUALITY, 24, Scalr.OP_ANTIALIAS)

                ByteArrayOutputStream avatarOutBuffer = new ByteArrayOutputStream()
                ImageIO.write(avatarImg, photoFileDescriptor.getExtension(), avatarOutBuffer)
                FileDescriptor avatarFD = new FileDescriptor()
                avatarFD.setCreateDate(new Date())
                avatarFD.setExtension(photoFileDescriptor.getExtension())
                avatarFD.setName(photoFileDescriptor.getName() + "_scaled_24")
                avatarFD.setSize((long) avatarOutBuffer.size())
                fileStorageService.saveFile(avatarFD, avatarOutBuffer.toByteArray())
                employee.setAvatar(avatarFD)
                em.persist(avatarFD)
                em.merge(employee)
            } catch (IOException e) {
                log.error("Cannot create avatar image for employee: " + employee.getName() + " (" + employee.getId() + ")")
            } catch (FileStorageException e) {
                log.error("Cannot save avatar file for employee: " + employee.getName() + " (" + employee.getId() + ")")
            }
        }
        tx.commit()
    } finally {
        tx.end()
    }
})
