
module UsersHelper
  def profile_img(user)
    return image_tag(user.avatar, alt: user.name, class: 'profile-img') if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, alt: user.name, class: 'profile-img')
  end

  def icon_img(user)
    return image_tag(user.avatar, alt: user.name, class: 'profile-img cover') if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, alt: user.name, class: 'profile-img cover')
  end

  def form_img(user)
    return image_tag(user.avatar, alt: user.name, class: 'profile-img cover-form') if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, alt: user.name, class: 'profile-img cover-form')
  end

  def main_profile_img(user)
    return image_tag(user.avatar, alt: user.name, class: 'profile-img cover-main') if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, alt: user.name, class: 'profile-img cover-main')
  end

  def index_profile_img(user)
    return image_tag(user.avatar, alt: user.name, class: 'profile-img cover-index') if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, alt: user.name, class: 'profile-img cover-index')
  end

  def message_profile_img(user)
    return image_tag(user.avatar, alt: user.name, class: 'profile-img cover-index') if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, alt: user.name, class: 'profile-img cover-message')
  end
end
